import 'dart:convert';

import 'package:elis/app/modules/model/formacao_model.dart';
import 'package:elis/app/modules/model/profile_model.dart';
import 'package:elis/app/modules/store/profile_store.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  UserStore userStore = Modular.get();
  final ProfileStore profileStore;

  _ProfileControllerBase(this.profileStore);

  @observable
  String nome = '';
  @observable
  String titulo = '';
  @observable
  String instituicao = '';
  @observable
  bool concluido = true;
  @observable
  ObservableList<FormacaoModel> formacao = <FormacaoModel>[].asObservable();
  @observable
  String psicologo = '';

  @observable
  bool card = false;

  @action
  Future getProfile(id) async {
    var response =
        await http.get('https://theraasch.com/elis/api/psicologos/$id');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var profile = ProfileModel.fromJson(data);
      profileStore.setProfile(profile);
      psicologo = profileStore.profileModel.id.toString();
    }
  }

  @action
  Future getFormacao() async {
    var response = await http
        .get('https://theraasch.com/elis/api/formacao/?psicologo=$psicologo');
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      data.forEach((item) {
        formacao.add(FormacaoModel.fromJson(item));
      });
    }
  }

  @action
  Future addFormacao() async {
    if (card == false) {
      card = true;
    } else {
      var response = await http.post('https://theraasch.com/elis/api/formacao/',
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "psicologo": profileStore.profileModel.id,
            "nome": nome,
            "titulo": titulo,
            "instituicao": instituicao,
            "concluido": false,
            "data_conclusao": "2020-08-05"
          }));
      print(response.statusCode);
      print(response.body);
      card = false;
    }
  }
}

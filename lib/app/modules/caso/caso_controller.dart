import 'dart:convert';
import 'package:elis/app/modules/model/caso_model.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'caso_controller.g.dart';

class CasoController = _CasoControllerBase with _$CasoController;

abstract class _CasoControllerBase with Store {
  UserStore userStore = Modular.get();
  @observable
  String id = '';
  @observable
  String idcaso = '';
  @observable
  String casonome = '';
  @observable
  String casodescricao = '';
  @observable
  bool card = false;
  @observable
  ObservableList<CasoModel> caso = <CasoModel>[].asObservable();

  @action
  Future getCaso() async {
    var response =
        await http.get('https://theraasch.com/elis/api/caso-clinicos/');
    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body) as List;
      caso.clear();
      data.forEach((element) async {
        caso.add(CasoModel.fromJson(element));
      });
      await Future.delayed(Duration(milliseconds: 200));
    }
  }

  @action
  Future setCaso() async {
    if (card == false) {
      card = true;
    } else {
      var response = await http.post(
        'https://theraasch.com/elis/api/caso-clinicos/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "nome": casonome,
            "descricao": casodescricao,
            "author": userStore.userModel.username,
            "status": false
          },
        ),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        card = false;
        getCaso();
      } else {
        card = false;
      }
    }
  }

  @action
  Future deletCaso() async {
    var response = await http
        .delete('https://theraasch.com/elis/api/caso-clinicos/$idcaso/');
    print('ID caso $idcaso');
    print(response.statusCode);
    print(response.body);
    getCaso();
  }
}

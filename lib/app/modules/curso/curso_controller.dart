import 'dart:convert';

import 'package:elis/app/modules/model/curso_model.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'curso_controller.g.dart';

class CursoController = _CursoControllerBase with _$CursoController;

abstract class _CursoControllerBase with Store {
  UserStore user = Modular.get();
  @observable
  String id;
  @observable
  bool card = false;
  @observable
  String cursonome = '';
  @observable
  String cursodescricao = '';
  @observable
  String qtdhoras = '';
  @observable
  String local = '';
  @observable
  String data = '';
  @observable
  String hora = '';

  @observable
  ObservableList<CursoModel> curso = <CursoModel>[].asObservable();

  @action
  Future getCurso() async {
    var response = await http.get('https://theraasch.com/elis/api/cursos/');
    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body) as List;
      curso.clear();
      data.forEach((element) async {
        curso.add(CursoModel.fromJson(element));
      });
    }
  }

  @action
  Future setCurso() async {
    if (card == false) {
      card = true;
    } else {
      var response = await http.post(
        'https://theraasch.com/elis/api/cursos/',
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "nome": cursonome,
          "descricao": cursodescricao,
          "author": user.userModel.username,
          "qtd_horas": qtdhoras,
          "local": local,
          "data": data,
          "hora": hora,
          "status": false
        }),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        card = false;
        getCurso();
      } else {
        getCurso();
        card = false;
      }
    }
  }

  @action
  Future deletcursoComentario() async {
    var response =
        await http.delete('https://theraasch.com/elis/api/cursos/$id/');
    getCurso();
  }
}

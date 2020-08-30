import 'dart:convert';
import 'package:elis/app/modules/model/curso_model.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'comment_controller.g.dart';

class CommentController = _CommentControllerBase with _$CommentController;

abstract class _CommentControllerBase with Store {
  UserStore user = Modular.get();
  @observable
  String idcurso = '';
  @observable
  String cursoid = '';
  @observable
  String descricao = '';
  @observable
  String nome = '';
  @observable
  bool card = false;

  @observable
  ObservableList<CursoModel> curso = <CursoModel>[].asObservable();

  @action
  Future getcurso() async {
    var response = await http.get(
        'https://theraasch.com/elis/api/curso-comentarios/?curso=$idcurso&author=');
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
  Future setCursoComentario(autor) async {
    if (card == false) {
      card = true;
    } else {
      var response =
          await http.post('https://theraasch.com/elis/api/curso-comentarios/',
              headers: {"Content-Type": "application/json"},
              body: json.encode({
                "curso": idcurso,
                "nome": 'nome',
                "descricao": descricao,
                "author": autor,
                "status": true
              }));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        getcurso();
        card = false;
      } else {
        card = false;
      }
    }
  }

  @action
  Future deleteCasoCurso(id) async {
    var response = await http
        .delete('https://theraasch.com/elis/api/curso-comentarios/$id');
    getcurso();
  }
}

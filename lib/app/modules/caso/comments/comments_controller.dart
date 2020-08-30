import 'dart:convert';

import 'package:elis/app/modules/model/caso_comentario.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'comments_controller.g.dart';

class CommentsController = _CommentsControllerBase with _$CommentsController;

abstract class _CommentsControllerBase with Store {
  UserStore user = Modular.get();
  @observable
  String id = '';
  @observable
  String commentId = '';
  @observable
  String nome = '';
  @observable
  String descricao = '';
  @observable
  bool card = false;
  @observable
  ObservableList<CasoComentarioModel> casocomentario =
      <CasoComentarioModel>[].asObservable();

  @action
  Future getCasoComentario() async {
    var response = await http.get(
        'https://theraasch.com/elis/api/caso-comentarios/?caso=$id&author=');
    if (response.statusCode == 200) {
      var data = await json.decode(response.body) as List;
      casocomentario.clear();
      print(id);
      print(response.body);
      data.forEach((element) async {
        casocomentario.add(CasoComentarioModel.fromJson(element));
      });
      return data;
    }
  }

  @action
  Future setCasoComentario() async {
    if (card == false) {
      card = true;
    } else {
      var response =
          await http.post('https://theraasch.com/elis/api/caso-comentarios/',
              headers: {"Content-Type": "application/json"},
              body: json.encode(
                {
                  "caso": id,
                  "nome": 'nome',
                  "descricao": descricao,
                  "author": user.userModel.username,
                  "status": true
                },
              ));
      print(response.statusCode);
      if (response.statusCode == 201) {
        getCasoComentario();
        card = false;
      } else {
        card = false;
      }
    }
  }

  @action
  Future deleteCasoComentario() async {
    var response = await http.delete(
      'https://theraasch.com/elis/api/caso-comentarios/$commentId/',
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      card = false;
      getCasoComentario();
    } else {
      card = false;
      getCasoComentario();
    }
  }
}

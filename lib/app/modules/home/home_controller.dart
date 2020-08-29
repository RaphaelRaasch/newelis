import 'dart:convert';

import 'package:elis/app/modules/model/caso_comentario.dart';
import 'package:elis/app/modules/model/caso_model.dart';
import 'package:elis/app/modules/model/home_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<HomeViewModel> homeviewmodel =
      <HomeViewModel>[].asObservable();
  Future<List<CasoComentarioModel>> getCasoComentario(id) async {
    List<CasoComentarioModel> casocomentario = List<CasoComentarioModel>();
    var response = await http.get(
        'https://theraasch.com/elis/api/caso-comentarios/?caso=$id&author=');
    if (response.statusCode == 200) {
      var data = await json.decode(response.body) as List;
      print(id);
      print(response.body);
      data.forEach((element) async {
        casocomentario.add(CasoComentarioModel.fromJson(element));
      });
    }
    return casocomentario;
  }

  Future<List<CasoModel>> getCaso() async {
    List<CasoModel> caso = List<CasoModel>();
    var response =
        await http.get('https://theraasch.com/elis/api/caso-clinicos/');
    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body) as List;
      data.forEach((element) async {
        caso.add(CasoModel.fromJson(element));
      });
    }
    return caso;
  }

  @action
  Future<void> load() async {
    var listCaso = await getCaso();
    for (var item in listCaso) {
      var listComentarios = await getCasoComentario(item.id);
      homeviewmodel.add(
        HomeViewModel(caso: item, comentario: listComentarios),
      );
    }
    homeviewmodel
        .sort((a, b) => b.comentario.length.compareTo(a.comentario.length));
  }
}

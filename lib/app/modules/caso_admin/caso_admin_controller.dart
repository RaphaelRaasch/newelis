import 'dart:convert';

import 'package:elis/app/modules/model/caso_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'caso_admin_controller.g.dart';

class CasoAdminController = _CasoAdminControllerBase with _$CasoAdminController;

abstract class _CasoAdminControllerBase with Store {
  @observable
  bool check = false;
  @observable
  String id = '';
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
    }
  }

  Future aproveCaso() async {
    var response = await http.put(
        'https://theraasch.com/elis/api/caso-clinicos/$id/',
        headers: {"Content-Type": "application/json"},
        body: json.encode({"status": check}));
    print(response.statusCode);
    print(response.body);
    getCaso();
  }
}

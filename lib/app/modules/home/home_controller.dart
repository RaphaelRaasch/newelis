import 'dart:convert';

import 'package:elis/app/modules/model/profile_model.dart';
import 'package:elis/app/modules/model/user_model.dart';
import 'package:elis/app/modules/store/profile_store.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  UserStore userStore;
  final ProfileStore profileStore;

  _HomeControllerBase(this.profileStore);

  List<ProfileModel> profile = List();

  @action
  Future getProfile() async {
    String URL =
        'https://theraasch.com/elis/api/psicologos/?user=${userStore.userModel.userId}';

    var response = await http.get(URL);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      var store = data.forEach((item) {
        profile.add(ProfileModel.fromJson(item));
      });
    } else {
      return;
    }
  }
}

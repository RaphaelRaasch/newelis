import 'dart:convert';

import 'package:elis/app/modules/model/profile_model.dart';
import 'package:elis/app/modules/model/user_model.dart';
import 'package:elis/app/modules/store/profile_store.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

const String AUTH_URL = 'https://theraasch.com/elis/auth/';

abstract class _AuthControllerBase with Store {
  final UserStore userStore;
  final ProfileStore profileStore;

  _AuthControllerBase(this.userStore, this.profileStore);
  @observable
  String username = '';
  @observable
  String password = '';
  @observable
  bool loading = false;
  @observable
  String id = '';

  @action
  Future auth() async {
    loading = true;
    var response = await http.post(AUTH_URL,
        body: ({"username": username, "password": password}));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var user = UserModel.fromJson(data);

      userStore.setUser(user);
      id = userStore.userModel.userId.toString();
      getProfile(id);
      loading = false;
      print('ok');
      Modular.to.pushReplacementNamed('/home');
      loading = false;
    } else {
      print(response.statusCode);
      print('erro');
      loading = false;
      return;
    }
  }

  @action
  Future getProfile(id) async {
    var response =
        await http.get('https://theraasch.com/elis/api/psicologos/$id');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var profile = ProfileModel.fromJson(data);
      profileStore.setProfile(profile);
    }
  }
}

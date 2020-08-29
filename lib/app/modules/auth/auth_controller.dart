import 'dart:convert';

import 'package:elis/app/modules/model/user_model.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

const String AUTH_URL = 'https://theraasch.com/elis/auth/';

abstract class _AuthControllerBase with Store {
  final UserStore userStore;

  _AuthControllerBase(this.userStore);
  @observable
  String username = '';
  @observable
  String password = '';
  @observable
  bool loading = false;

  @action
  Future auth() async {
    loading = true;
    var response = await http.post(AUTH_URL,
        body: ({"username": username, "password": password}));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var user = UserModel.fromJson(data);

      userStore.setUser(user);
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
}

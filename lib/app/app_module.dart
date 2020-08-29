import 'package:elis/app/modules/auth/auth_module.dart';
import 'package:elis/app/modules/caso/caso_module.dart';
import 'package:elis/app/modules/store/profile_store.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:elis/app/app_widget.dart';
import 'package:elis/app/modules/home/home_module.dart';

import 'modules/curso/curso_module.dart';
import 'modules/store/user_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProfileStore()),
        Bind((i) => UserStore()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: AuthModule()),
        Router('/home', module: HomeModule()),
        Router('/caso', module: CasoModule()),
        Router('/curso', module: CursoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

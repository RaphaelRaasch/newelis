import 'package:elis/app/modules/caso/caso_controller.dart';
import 'package:elis/app/modules/home/profile/profile_controller.dart';
import 'package:elis/app/modules/home/profile/profile_page.dart';

import 'drawer/drawer_controller.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProfileController(Modular.get())),
        Bind((i) => DrawerController()),
        Bind((i) => HomeController(Modular.get())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/profile', child: (_, args) => ProfilePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

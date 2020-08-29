import 'caso_admin_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'caso_admin_page.dart';

class CasoAdminModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CasoAdminController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CasoAdminPage()),
      ];

  static Inject get to => Inject<CasoAdminModule>.of();
}

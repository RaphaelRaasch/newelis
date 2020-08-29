import 'package:elis/app/modules/caso/comments/comments_page.dart';

import 'comments/comments_controller.dart';
import 'caso_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'caso_page.dart';

class CasoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CommentsController()),
        Bind((i) => CasoController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CasoPage()),
        Router('/commentcaso',
            child: (_, args) => CommentsPage(
                  comment: args.data,
                )),
      ];

  static Inject get to => Inject<CasoModule>.of();
}

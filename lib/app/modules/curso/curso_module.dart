import 'comment/comment_controller.dart';
import 'comment/comment_page.dart';
import 'curso_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'curso_page.dart';

class CursoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CommentController()),
        Bind((i) => CursoController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CursoPage()),
        Router('/commentcurso',
            child: (_, args) => CommentPage(
                  comment: args.data,
                )),
      ];

  static Inject get to => Inject<CursoModule>.of();
}

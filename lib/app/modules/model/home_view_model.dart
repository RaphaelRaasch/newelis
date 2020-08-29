import 'package:elis/app/modules/model/caso_comentario.dart';
import 'package:elis/app/modules/model/caso_model.dart';

class HomeViewModel {
  CasoModel caso;
  List<CasoComentarioModel> comentario;

  HomeViewModel({this.caso, this.comentario});
}

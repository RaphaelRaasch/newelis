// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CommentsController on _CommentsControllerBase, Store {
  final _$idAtom = Atom(name: '_CommentsControllerBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$commentIdAtom = Atom(name: '_CommentsControllerBase.commentId');

  @override
  String get commentId {
    _$commentIdAtom.reportRead();
    return super.commentId;
  }

  @override
  set commentId(String value) {
    _$commentIdAtom.reportWrite(value, super.commentId, () {
      super.commentId = value;
    });
  }

  final _$nomeAtom = Atom(name: '_CommentsControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_CommentsControllerBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$cardAtom = Atom(name: '_CommentsControllerBase.card');

  @override
  bool get card {
    _$cardAtom.reportRead();
    return super.card;
  }

  @override
  set card(bool value) {
    _$cardAtom.reportWrite(value, super.card, () {
      super.card = value;
    });
  }

  final _$casocomentarioAtom =
      Atom(name: '_CommentsControllerBase.casocomentario');

  @override
  ObservableList<CasoComentarioModel> get casocomentario {
    _$casocomentarioAtom.reportRead();
    return super.casocomentario;
  }

  @override
  set casocomentario(ObservableList<CasoComentarioModel> value) {
    _$casocomentarioAtom.reportWrite(value, super.casocomentario, () {
      super.casocomentario = value;
    });
  }

  final _$getCasoComentarioAsyncAction =
      AsyncAction('_CommentsControllerBase.getCasoComentario');

  @override
  Future<dynamic> getCasoComentario() {
    return _$getCasoComentarioAsyncAction.run(() => super.getCasoComentario());
  }

  final _$setCasoComentarioAsyncAction =
      AsyncAction('_CommentsControllerBase.setCasoComentario');

  @override
  Future<dynamic> setCasoComentario() {
    return _$setCasoComentarioAsyncAction.run(() => super.setCasoComentario());
  }

  final _$deleteCasoComentarioAsyncAction =
      AsyncAction('_CommentsControllerBase.deleteCasoComentario');

  @override
  Future<dynamic> deleteCasoComentario() {
    return _$deleteCasoComentarioAsyncAction
        .run(() => super.deleteCasoComentario());
  }

  @override
  String toString() {
    return '''
id: ${id},
commentId: ${commentId},
nome: ${nome},
descricao: ${descricao},
card: ${card},
casocomentario: ${casocomentario}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CommentController on _CommentControllerBase, Store {
  final _$idcursoAtom = Atom(name: '_CommentControllerBase.idcurso');

  @override
  String get idcurso {
    _$idcursoAtom.reportRead();
    return super.idcurso;
  }

  @override
  set idcurso(String value) {
    _$idcursoAtom.reportWrite(value, super.idcurso, () {
      super.idcurso = value;
    });
  }

  final _$cursoidAtom = Atom(name: '_CommentControllerBase.cursoid');

  @override
  String get cursoid {
    _$cursoidAtom.reportRead();
    return super.cursoid;
  }

  @override
  set cursoid(String value) {
    _$cursoidAtom.reportWrite(value, super.cursoid, () {
      super.cursoid = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_CommentControllerBase.descricao');

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

  final _$nomeAtom = Atom(name: '_CommentControllerBase.nome');

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

  final _$cardAtom = Atom(name: '_CommentControllerBase.card');

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

  final _$cursoAtom = Atom(name: '_CommentControllerBase.curso');

  @override
  ObservableList<CursoModel> get curso {
    _$cursoAtom.reportRead();
    return super.curso;
  }

  @override
  set curso(ObservableList<CursoModel> value) {
    _$cursoAtom.reportWrite(value, super.curso, () {
      super.curso = value;
    });
  }

  final _$getcursoAsyncAction = AsyncAction('_CommentControllerBase.getcurso');

  @override
  Future<dynamic> getcurso() {
    return _$getcursoAsyncAction.run(() => super.getcurso());
  }

  final _$setCursoComentarioAsyncAction =
      AsyncAction('_CommentControllerBase.setCursoComentario');

  @override
  Future<dynamic> setCursoComentario() {
    return _$setCursoComentarioAsyncAction
        .run(() => super.setCursoComentario());
  }

  final _$deleteCasoCursoAsyncAction =
      AsyncAction('_CommentControllerBase.deleteCasoCurso');

  @override
  Future<dynamic> deleteCasoCurso(dynamic id) {
    return _$deleteCasoCursoAsyncAction.run(() => super.deleteCasoCurso(id));
  }

  @override
  String toString() {
    return '''
idcurso: ${idcurso},
cursoid: ${cursoid},
descricao: ${descricao},
nome: ${nome},
card: ${card},
curso: ${curso}
    ''';
  }
}

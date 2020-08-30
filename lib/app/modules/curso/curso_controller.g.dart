// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curso_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CursoController on _CursoControllerBase, Store {
  final _$idAtom = Atom(name: '_CursoControllerBase.id');

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

  final _$cardAtom = Atom(name: '_CursoControllerBase.card');

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

  final _$cursonomeAtom = Atom(name: '_CursoControllerBase.cursonome');

  @override
  String get cursonome {
    _$cursonomeAtom.reportRead();
    return super.cursonome;
  }

  @override
  set cursonome(String value) {
    _$cursonomeAtom.reportWrite(value, super.cursonome, () {
      super.cursonome = value;
    });
  }

  final _$cursodescricaoAtom =
      Atom(name: '_CursoControllerBase.cursodescricao');

  @override
  String get cursodescricao {
    _$cursodescricaoAtom.reportRead();
    return super.cursodescricao;
  }

  @override
  set cursodescricao(String value) {
    _$cursodescricaoAtom.reportWrite(value, super.cursodescricao, () {
      super.cursodescricao = value;
    });
  }

  final _$qtdhorasAtom = Atom(name: '_CursoControllerBase.qtdhoras');

  @override
  String get qtdhoras {
    _$qtdhorasAtom.reportRead();
    return super.qtdhoras;
  }

  @override
  set qtdhoras(String value) {
    _$qtdhorasAtom.reportWrite(value, super.qtdhoras, () {
      super.qtdhoras = value;
    });
  }

  final _$localAtom = Atom(name: '_CursoControllerBase.local');

  @override
  String get local {
    _$localAtom.reportRead();
    return super.local;
  }

  @override
  set local(String value) {
    _$localAtom.reportWrite(value, super.local, () {
      super.local = value;
    });
  }

  final _$dataAtom = Atom(name: '_CursoControllerBase.data');

  @override
  String get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$horaAtom = Atom(name: '_CursoControllerBase.hora');

  @override
  String get hora {
    _$horaAtom.reportRead();
    return super.hora;
  }

  @override
  set hora(String value) {
    _$horaAtom.reportWrite(value, super.hora, () {
      super.hora = value;
    });
  }

  final _$cursoAtom = Atom(name: '_CursoControllerBase.curso');

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

  final _$getCursoAsyncAction = AsyncAction('_CursoControllerBase.getCurso');

  @override
  Future<dynamic> getCurso() {
    return _$getCursoAsyncAction.run(() => super.getCurso());
  }

  final _$setCursoAsyncAction = AsyncAction('_CursoControllerBase.setCurso');

  @override
  Future<dynamic> setCurso() {
    return _$setCursoAsyncAction.run(() => super.setCurso());
  }

  final _$deletcursoAsyncAction =
      AsyncAction('_CursoControllerBase.deletcurso');

  @override
  Future<dynamic> deletcurso(dynamic id) {
    return _$deletcursoAsyncAction.run(() => super.deletcurso(id));
  }

  @override
  String toString() {
    return '''
id: ${id},
card: ${card},
cursonome: ${cursonome},
cursodescricao: ${cursodescricao},
qtdhoras: ${qtdhoras},
local: ${local},
data: ${data},
hora: ${hora},
curso: ${curso}
    ''';
  }
}

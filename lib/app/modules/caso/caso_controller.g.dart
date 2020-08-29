// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caso_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasoController on _CasoControllerBase, Store {
  final _$idAtom = Atom(name: '_CasoControllerBase.id');

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

  final _$idcasoAtom = Atom(name: '_CasoControllerBase.idcaso');

  @override
  String get idcaso {
    _$idcasoAtom.reportRead();
    return super.idcaso;
  }

  @override
  set idcaso(String value) {
    _$idcasoAtom.reportWrite(value, super.idcaso, () {
      super.idcaso = value;
    });
  }

  final _$casonomeAtom = Atom(name: '_CasoControllerBase.casonome');

  @override
  String get casonome {
    _$casonomeAtom.reportRead();
    return super.casonome;
  }

  @override
  set casonome(String value) {
    _$casonomeAtom.reportWrite(value, super.casonome, () {
      super.casonome = value;
    });
  }

  final _$casodescricaoAtom = Atom(name: '_CasoControllerBase.casodescricao');

  @override
  String get casodescricao {
    _$casodescricaoAtom.reportRead();
    return super.casodescricao;
  }

  @override
  set casodescricao(String value) {
    _$casodescricaoAtom.reportWrite(value, super.casodescricao, () {
      super.casodescricao = value;
    });
  }

  final _$cardAtom = Atom(name: '_CasoControllerBase.card');

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

  final _$casoAtom = Atom(name: '_CasoControllerBase.caso');

  @override
  ObservableList<CasoModel> get caso {
    _$casoAtom.reportRead();
    return super.caso;
  }

  @override
  set caso(ObservableList<CasoModel> value) {
    _$casoAtom.reportWrite(value, super.caso, () {
      super.caso = value;
    });
  }

  final _$getCasoAsyncAction = AsyncAction('_CasoControllerBase.getCaso');

  @override
  Future<dynamic> getCaso() {
    return _$getCasoAsyncAction.run(() => super.getCaso());
  }

  final _$setCasoAsyncAction = AsyncAction('_CasoControllerBase.setCaso');

  @override
  Future<dynamic> setCaso() {
    return _$setCasoAsyncAction.run(() => super.setCaso());
  }

  final _$deletCasoAsyncAction = AsyncAction('_CasoControllerBase.deletCaso');

  @override
  Future<dynamic> deletCaso() {
    return _$deletCasoAsyncAction.run(() => super.deletCaso());
  }

  @override
  String toString() {
    return '''
id: ${id},
idcaso: ${idcaso},
casonome: ${casonome},
casodescricao: ${casodescricao},
card: ${card},
caso: ${caso}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caso_admin_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasoAdminController on _CasoAdminControllerBase, Store {
  final _$checkAtom = Atom(name: '_CasoAdminControllerBase.check');

  @override
  bool get check {
    _$checkAtom.reportRead();
    return super.check;
  }

  @override
  set check(bool value) {
    _$checkAtom.reportWrite(value, super.check, () {
      super.check = value;
    });
  }

  final _$idAtom = Atom(name: '_CasoAdminControllerBase.id');

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

  final _$casoAtom = Atom(name: '_CasoAdminControllerBase.caso');

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

  final _$getCasoAsyncAction = AsyncAction('_CasoAdminControllerBase.getCaso');

  @override
  Future<dynamic> getCaso() {
    return _$getCasoAsyncAction.run(() => super.getCaso());
  }

  @override
  String toString() {
    return '''
check: ${check},
id: ${id},
caso: ${caso}
    ''';
  }
}

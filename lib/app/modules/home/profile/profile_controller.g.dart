// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
  final _$nomeAtom = Atom(name: '_ProfileControllerBase.nome');

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

  final _$tituloAtom = Atom(name: '_ProfileControllerBase.titulo');

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  final _$instituicaoAtom = Atom(name: '_ProfileControllerBase.instituicao');

  @override
  String get instituicao {
    _$instituicaoAtom.reportRead();
    return super.instituicao;
  }

  @override
  set instituicao(String value) {
    _$instituicaoAtom.reportWrite(value, super.instituicao, () {
      super.instituicao = value;
    });
  }

  final _$concluidoAtom = Atom(name: '_ProfileControllerBase.concluido');

  @override
  bool get concluido {
    _$concluidoAtom.reportRead();
    return super.concluido;
  }

  @override
  set concluido(bool value) {
    _$concluidoAtom.reportWrite(value, super.concluido, () {
      super.concluido = value;
    });
  }

  final _$formacaoAtom = Atom(name: '_ProfileControllerBase.formacao');

  @override
  List<FormacaoModel> get formacao {
    _$formacaoAtom.reportRead();
    return super.formacao;
  }

  @override
  set formacao(List<FormacaoModel> value) {
    _$formacaoAtom.reportWrite(value, super.formacao, () {
      super.formacao = value;
    });
  }

  final _$psicologoAtom = Atom(name: '_ProfileControllerBase.psicologo');

  @override
  String get psicologo {
    _$psicologoAtom.reportRead();
    return super.psicologo;
  }

  @override
  set psicologo(String value) {
    _$psicologoAtom.reportWrite(value, super.psicologo, () {
      super.psicologo = value;
    });
  }

  final _$cardAtom = Atom(name: '_ProfileControllerBase.card');

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

  final _$getProfileAsyncAction =
      AsyncAction('_ProfileControllerBase.getProfile');

  @override
  Future<dynamic> getProfile(dynamic id) {
    return _$getProfileAsyncAction.run(() => super.getProfile(id));
  }

  final _$getFormacaoAsyncAction =
      AsyncAction('_ProfileControllerBase.getFormacao');

  @override
  Future<dynamic> getFormacao() {
    return _$getFormacaoAsyncAction.run(() => super.getFormacao());
  }

  final _$addFormacaoAsyncAction =
      AsyncAction('_ProfileControllerBase.addFormacao');

  @override
  Future<dynamic> addFormacao() {
    return _$addFormacaoAsyncAction.run(() => super.addFormacao());
  }

  @override
  String toString() {
    return '''
nome: ${nome},
titulo: ${titulo},
instituicao: ${instituicao},
concluido: ${concluido},
formacao: ${formacao},
psicologo: ${psicologo},
card: ${card}
    ''';
  }
}

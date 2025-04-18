// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orchestrator_page_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrchestratorPageViewModel on _OrchestratorPageViewModelBase, Store {
  late final _$currentIndexAtom = Atom(
      name: '_OrchestratorPageViewModelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$_OrchestratorPageViewModelBaseActionController =
      ActionController(
          name: '_OrchestratorPageViewModelBase', context: context);

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$_OrchestratorPageViewModelBaseActionController
        .startAction(name: '_OrchestratorPageViewModelBase.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$_OrchestratorPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}

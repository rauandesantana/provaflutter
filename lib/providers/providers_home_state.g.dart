// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProvidersHomeState on ProvidersHomeStateBase, Store {
  late final _$textListAtom =
      Atom(name: 'ProvidersHomeStateBase.textList', context: context);

  @override
  List<Map<String, dynamic>> get textList {
    _$textListAtom.reportRead();
    return super.textList;
  }

  @override
  set textList(List<Map<String, dynamic>> value) {
    _$textListAtom.reportWrite(value, super.textList, () {
      super.textList = value;
    });
  }

  late final _$ProvidersHomeStateBaseActionController =
      ActionController(name: 'ProvidersHomeStateBase', context: context);

  @override
  void activeEditMode(int index) {
    final _$actionInfo = _$ProvidersHomeStateBaseActionController.startAction(
        name: 'ProvidersHomeStateBase.activeEditMode');
    try {
      return super.activeEditMode(index);
    } finally {
      _$ProvidersHomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void activeDeleteMode(int index) {
    final _$actionInfo = _$ProvidersHomeStateBaseActionController.startAction(
        name: 'ProvidersHomeStateBase.activeDeleteMode');
    try {
      return super.activeDeleteMode(index);
    } finally {
      _$ProvidersHomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textList: ${textList}
    ''';
  }
}

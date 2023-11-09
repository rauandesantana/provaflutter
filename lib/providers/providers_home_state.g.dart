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
  List<ModalsTextItems> get textList {
    _$textListAtom.reportRead();
    return super.textList;
  }

  @override
  set textList(List<ModalsTextItems> value) {
    _$textListAtom.reportWrite(value, super.textList, () {
      super.textList = value;
    });
  }

  late final _$selectedItemAtom =
      Atom(name: 'ProvidersHomeStateBase.selectedItem', context: context);

  @override
  ModalsTextItems? get selectedItem {
    _$selectedItemAtom.reportRead();
    return super.selectedItem;
  }

  @override
  set selectedItem(ModalsTextItems? value) {
    _$selectedItemAtom.reportWrite(value, super.selectedItem, () {
      super.selectedItem = value;
    });
  }

  late final _$blockScreenAtom =
      Atom(name: 'ProvidersHomeStateBase.blockScreen', context: context);

  @override
  bool get blockScreen {
    _$blockScreenAtom.reportRead();
    return super.blockScreen;
  }

  @override
  set blockScreen(bool value) {
    _$blockScreenAtom.reportWrite(value, super.blockScreen, () {
      super.blockScreen = value;
    });
  }

  late final _$ProvidersHomeStateBaseActionController =
      ActionController(name: 'ProvidersHomeStateBase', context: context);

  @override
  ModalsTextItems? activeEditMode(int index) {
    final _$actionInfo = _$ProvidersHomeStateBaseActionController.startAction(
        name: 'ProvidersHomeStateBase.activeEditMode');
    try {
      return super.activeEditMode(index);
    } finally {
      _$ProvidersHomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ModalsTextItems? activeDeleteMode(int index) {
    final _$actionInfo = _$ProvidersHomeStateBaseActionController.startAction(
        name: 'ProvidersHomeStateBase.activeDeleteMode');
    try {
      return super.activeDeleteMode(index);
    } finally {
      _$ProvidersHomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem(String text) {
    final _$actionInfo = _$ProvidersHomeStateBaseActionController.startAction(
        name: 'ProvidersHomeStateBase.addItem');
    try {
      return super.addItem(text);
    } finally {
      _$ProvidersHomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editItem(String text) {
    final _$actionInfo = _$ProvidersHomeStateBaseActionController.startAction(
        name: 'ProvidersHomeStateBase.editItem');
    try {
      return super.editItem(text);
    } finally {
      _$ProvidersHomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItem() {
    final _$actionInfo = _$ProvidersHomeStateBaseActionController.startAction(
        name: 'ProvidersHomeStateBase.deleteItem');
    try {
      return super.deleteItem();
    } finally {
      _$ProvidersHomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deselectMode() {
    final _$actionInfo = _$ProvidersHomeStateBaseActionController.startAction(
        name: 'ProvidersHomeStateBase.deselectMode');
    try {
      return super.deselectMode();
    } finally {
      _$ProvidersHomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBlockScreen(bool value) {
    final _$actionInfo = _$ProvidersHomeStateBaseActionController.startAction(
        name: 'ProvidersHomeStateBase.setBlockScreen');
    try {
      return super.setBlockScreen(value);
    } finally {
      _$ProvidersHomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textList: ${textList},
selectedItem: ${selectedItem},
blockScreen: ${blockScreen}
    ''';
  }
}

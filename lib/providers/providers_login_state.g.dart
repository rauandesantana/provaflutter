// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_login_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProvidersLoginState on ProvidersLoginStateBase, Store {
  late final _$isSignInAtom =
      Atom(name: 'ProvidersLoginStateBase.isSignIn', context: context);

  @override
  bool get isSignIn {
    _$isSignInAtom.reportRead();
    return super.isSignIn;
  }

  @override
  set isSignIn(bool value) {
    _$isSignInAtom.reportWrite(value, super.isSignIn, () {
      super.isSignIn = value;
    });
  }

  late final _$ProvidersLoginStateBaseActionController =
      ActionController(name: 'ProvidersLoginStateBase', context: context);

  @override
  void setIsSignIn(bool value) {
    final _$actionInfo = _$ProvidersLoginStateBaseActionController.startAction(
        name: 'ProvidersLoginStateBase.setIsSignIn');
    try {
      return super.setIsSignIn(value);
    } finally {
      _$ProvidersLoginStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleIsSignIn() {
    final _$actionInfo = _$ProvidersLoginStateBaseActionController.startAction(
        name: 'ProvidersLoginStateBase.toggleIsSignIn');
    try {
      return super.toggleIsSignIn();
    } finally {
      _$ProvidersLoginStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSignIn: ${isSignIn}
    ''';
  }
}

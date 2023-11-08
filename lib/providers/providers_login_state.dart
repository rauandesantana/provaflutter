import 'package:mobx/mobx.dart';
part 'providers_login_state.g.dart';

// ============================================================================= Providers Login State
class ProvidersLoginState = ProvidersLoginStateBase with _$ProvidersLoginState;

// ============================================================================= Providers Login State Base
abstract class ProvidersLoginStateBase with Store {
  //////////////////////////////////////////////////////////////////////////////
  @observable
  bool isSignIn = false;
  //////////////////////////////////////////////////////////////////////////////

  @action
  void setIsSignIn(bool value) => isSignIn = value;

  @action
  void toggleIsSignIn() => isSignIn = !isSignIn;
}


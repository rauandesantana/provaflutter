import 'package:provaflutter/import_collections.dart';
export 'package:provaflutter/providers/providers_home_state.dart';
export 'package:provaflutter/providers/providers_login_state.dart';
export 'package:provaflutter/providers/providers_app_state.dart';

// ============================================================================= Providers
final providers = [
  ChangeNotifierProvider(create: (context) => providersAppState),
  Provider(create: (context) => providersLoginState),
  Provider(create: (context) => providersHomeState),
];

// ============================================================================= Providers App State
final providersAppState = ProvidersAppState();

// ============================================================================= Providers Login State
final providersLoginState = ProvidersLoginState();

// ============================================================================= Providers Home State
final providersHomeState = ProvidersHomeState();
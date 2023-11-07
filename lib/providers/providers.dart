import 'package:provaflutter/import_collections.dart';
import 'package:provaflutter/providers/providers_app_state.dart';

// ============================================================================= Providers
final providers = [
  ChangeNotifierProvider(create: (context) => providersAppState),
];

// ============================================================================= Providers App State
final providersAppState = ProvidersAppState();
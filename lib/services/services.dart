import 'package:provaflutter/services/services_launcher_url.dart';
import 'package:provaflutter/services/services_mockapi.dart';

// ============================================================================= Services
class Services {
  const Services();
  //////////////////////////////////////////////////////////////////////////////
  static $ServicesLauncherUrl get launcherUrl => const $ServicesLauncherUrl();
  static $ServicesMockAPI get mockAPI => const $ServicesMockAPI();
}

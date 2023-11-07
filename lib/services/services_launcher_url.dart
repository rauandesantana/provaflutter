import 'package:provaflutter/import_collections.dart';

// ============================================================================= Services Launcher Url
class $ServicesLauncherUrl {
  const $ServicesLauncherUrl();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Open
  void open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }
}

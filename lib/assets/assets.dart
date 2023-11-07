import 'package:provaflutter/assets/assets_images.dart';

// ============================================================================= Assets
class Assets {
  const Assets();
  //////////////////////////////////////////////////////////////////////////////
  static const String _path = "assets";
  static String get path => _path;
  //////////////////////////////////////////////////////////////////////////////
  static $AssetsImages get images => $AssetsImages(_path);
}
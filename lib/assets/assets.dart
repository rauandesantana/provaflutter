import 'package:provaflutter/assets/assets_icons.dart';
import 'package:provaflutter/assets/assets_images.dart';

// ============================================================================= Assets
class Assets {
  const Assets();
  //////////////////////////////////////////////////////////////////////////////
  static const String _path = "assets";
  static String get path => _path;
  //////////////////////////////////////////////////////////////////////////////
  static $AssetsImages get images => $AssetsImages(_path);
  static $AssetsIcons get icons => $AssetsIcons(_path);
}
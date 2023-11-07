// ============================================================================= Assets
class $AssetsImages {
  $AssetsImages(String path) {
    _path = "$path/images";
  }
  //////////////////////////////////////////////////////////////////////////////
  late String _path;
  String get path => _path;
  //////////////////////////////////////////////////////////////////////////////
  $ImagesLogos get logos => $ImagesLogos(_path);
}

// ============================================================================= Images Logos
class $ImagesLogos {
  $ImagesLogos(String path) {
    _path = "$path/logos";
  }
  //////////////////////////////////////////////////////////////////////////////
  late String _path;
  String get path => _path;
  //////////////////////////////////////////////////////////////////////////////
  String get flutter => "$_path/flutter.png";
}

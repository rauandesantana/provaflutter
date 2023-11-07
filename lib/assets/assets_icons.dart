import 'package:provaflutter/import_collections.dart';

// ============================================================================= Assets Icons
class $AssetsIcons {
  $AssetsIcons(String path) {
    _path = "$path/icons";
  }
  //////////////////////////////////////////////////////////////////////////////
  late String _path;
  String get path => _path;
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- User Rounded
  IconData get userRounded {
    return const IconData(
      0xe901,
      fontFamily: "User Rounded",
    );
  }

  // --------------------------------------------------------------------------- User Rounded
  IconData get lockRounded {
    return const IconData(
      0xe900,
      fontFamily: "Lock Rounded",
    );
  }
}

import 'package:provaflutter/import_collections.dart';

// ============================================================================= Providers App State
class ProvidersAppState extends ChangeNotifier {
  //////////////////////////////////////////////////////////////////////////////
  bool _isInitialized = false;
  bool _isAuthenticated = false;
  bool _alert = false;
  //////////////////////////////////////////////////////////////////////////////
  bool get isInitialized => _isInitialized;
  bool get isAuthenticated => _isAuthenticated;
  bool get alert => _alert;
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Set Authentication
  void setAuthentication(bool value) {
    if(_isAuthenticated != value) {
      _isAuthenticated = value;
      notifyListeners();
    }
  }

  // --------------------------------------------------------------------------- Restart
  void restart() {
    _isInitialized = false;
    _isAuthenticated = false;
    _alert = false;
    notifyListeners();
  }

  // --------------------------------------------------------------------------- Initialize
  void initialize(Iterable<Future> dependencyList) {
    if (_isInitialized == false) {
      Future.wait(dependencyList).then((dependencies) {
        _isInitialized = true;
      }).catchError((error, stack) {
        _alert = true;
      }).whenComplete(() {
        notifyListeners();
      });
    }
  }
}
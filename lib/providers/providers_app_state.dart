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
  void signOut() {
    if (_isAuthenticated == true) {
      _isAuthenticated = false;
      notifyListeners();
    }
  }

  // --------------------------------------------------------------------------- Sign In
  Future<String?> signIn({required String username, required Digest password}) {
    if (_isAuthenticated == false) {
      return Services.mockAPI
          .signIn(username: username, password: password)
          .then(
        (result) {
          if (result == true) {
            _isAuthenticated = true;
            notifyListeners();
            return null;
          } else if (result == false) {
            return Languages.current.invalidUserOrPass;
          } else {
            return Languages.current.errorAuthentication;
          }
        },
      );
    } else {
      return Future(() => null);
    }
  }

  // --------------------------------------------------------------------------- Sign Up
  Future<Object> signUp({required String username, required Digest password}) {
    if (_isAuthenticated == false) {
      return Services.mockAPI
          .signUp(username: username, password: password)
          .then((result) {
        if (result == true) {
          return {
            "text" : Languages.current.userCreatedSuccessfully,
            "status" : "success",
          };
        } else {
          return {
            "text" : Languages.current.invalidUser,
            "status" : "fail",
          };
        }
      });
    } else {
      return Future(() => {
        "text" : Languages.current.invalidUser,
        "status" : "fail",
      });
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
        final data = dependencies.elementAt(0) as List<ModalsTextItems>;
        providersHomeState.initializeTextList(data);
        _isInitialized = true;
      }).catchError((error, stack) {
        _alert = true;
      }).whenComplete(() {
        notifyListeners();
      });
    }
  }
}

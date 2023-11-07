import 'package:provaflutter/import_collections.dart';
import 'package:provaflutter/pages/boot/pages_alert_screen.dart';
import 'package:provaflutter/pages/boot/pages_splash_screen.dart';
import 'package:provaflutter/pages/main/pages_home.dart';
import 'package:provaflutter/pages/main/pages_login.dart';

// ============================================================================= Pages
class Pages {
  Pages({
    required this.path,
    required this.widget,
    this.tags = const [PagesTags.public],
  }) {
    final indexStartName = path.lastIndexOf("/") + 1;
    final generatedName = path.substring(indexStartName);
    name = (generatedName.isNotEmpty) ? generatedName : "initialPage";
    pageBuilder = (context, state) => MaterialPage(child: widget);
    route = GoRoute(
      path: path,
      name: name,
      pageBuilder: pageBuilder,
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  final String path;
  final Widget widget;
  final List<PagesTags> tags;
  late final String name;
  late final GoRouterPageBuilder pageBuilder;
  late final GoRoute route;

  // --------------------------------------------------------------------------- Contains Tags
  bool containTags(
    List<PagesTags> listTags, {
    bool containAll = false,
  }) {
    int contain = 0;

    for (var itemX in listTags) {
      for (var itemY in tags) {
        final finish = containAll == false && contain == listTags.length;
        if (itemX == itemY) contain++;
        if (finish) break;
      }
    }

    return (containAll) ? contain == listTags.length : contain > 0;
  }

  ////////////////////////////////////////////////////////////////////////////// Folders
  static $PagesBoot get boot => const $PagesBoot();
  static $PagesMain get main => const $PagesMain();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Find By Path
  static Pages findByPath(String path) {
    return _pagesList.firstWhere((page) => page.path == path);
  }

  // --------------------------------------------------------------------------- Pages List
  static final List<Pages> _pagesList = [
    boot.splashScreen,
    boot.alertScreen,
    main.login,
    main.home,
  ];
}

// ============================================================================= Pages Boot
class $PagesBoot {
  const $PagesBoot();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Splash Screen
  Pages get splashScreen {
    return Pages(
      path: "/",
      widget: const $PagesSplashScreen(),
    );
  }

  // --------------------------------------------------------------------------- Alert Screen
  Pages get alertScreen {
    return Pages(
      path: "/alert",
      widget: const $PagesAlertScreen(),
    );
  }
}

// ============================================================================= Pages Main
class $PagesMain {
  const $PagesMain();
//////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Login
  Pages get login {
    return Pages(
      path: "/login",
      tags: [PagesTags.public, PagesTags.auth],
      widget: const $PagesLogin(),
    );
  }

  // --------------------------------------------------------------------------- Home
  Pages get home {
    return Pages(
      path: "/home",
      tags: [PagesTags.private],
      widget: const $PagesHome(),
    );
  }
}

// ----------------------------------------------------------------------------- GoRouter
final goRouter = GoRouter(
    refreshListenable: providersAppState,
    routes: Pages._pagesList.map((page) => page.route).toList(),
    redirect: (context, state) {
      final appState = context.read<ProvidersAppState>();
      final currentPage = Pages.findByPath(state.matchedLocation);
      final isAuthPage = currentPage.containTags([PagesTags.auth]);
      final isPrivatePage = currentPage.containTags([PagesTags.private]);
      final init = appState.isInitialized;
      final auth = appState.isAuthenticated;
      final alert = appState.alert;

      // ----------------------------------------------------------------------- Not Initialized
      if (init == false && alert == false) {
        return Pages.boot.splashScreen.path;
      } else {
        // --------------------------------------------------------------------- Alert
        if (alert == true) {
          return Pages.boot.alertScreen.path;
        } else {
          // ------------------------------------------------------------------- Not Authenticated
          if (auth == false && isAuthPage == false) {
            return Pages.main.login.path;
          }
          // ------------------------------------------------------------------- Authenticated
          else if (auth == true && isPrivatePage == false) {
            return Pages.main.home.path;
          }
          // ------------------------------------------------------------------- Another
          else {
            return null;
          }
        }
      }
    });

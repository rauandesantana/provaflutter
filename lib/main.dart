import 'package:provaflutter/import_collections.dart';

void main() {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: providers,
      child: const ProvaFlutter(),
    ),
  );
}

class ProvaFlutter extends StatelessWidget {
  const ProvaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Prova Flutter',
      routerConfig: goRouter,
      // ----------------------------------------------------------------------- Language
      supportedLocales: Languages.delegate.supportedLocales,
      localizationsDelegates: const [
        Languages.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(colorScheme.onSurface),
            minimumSize: const MaterialStatePropertyAll(Size(130, 38)),
          ),
        ),
      ),
    );
  }
}

// ============================================================================= Color Scheme
final colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: const Color(0xFF2D948E),
  onPrimary: Colors.blueGrey.shade50,
  secondary: const Color(0xFF1B4F67),
  onSecondary: Colors.blueGrey.shade50,
  error: const Color(0xFFD73131),
  onError: const Color(0xFF980505),
  background: const Color(0xFF1B4F67),
  onBackground: const Color(0xFF27807B),
  surface: const Color(0xFF44BC6E),
  onSurface: Colors.blueGrey.shade50,
);

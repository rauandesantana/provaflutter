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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
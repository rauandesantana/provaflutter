import 'package:provaflutter/import_collections.dart';

class $PagesSplashScreen extends StatefulWidget {
  const $PagesSplashScreen({super.key});

  @override
  State<$PagesSplashScreen> createState() => _$PagesSplashScreenState();
}

class _$PagesSplashScreenState extends State<$PagesSplashScreen> {
  final double _size = 180;

  @override
  void initState() {
    super.initState();
    // ------------------------------------------------------------------------- Loading Dependencies
    Future.wait([
      // ----------------------------------------------------------------------- List Dependencies
      Future.delayed(const Duration(seconds: 2), () => "firebase"),
      Future.delayed(const Duration(seconds: 1), () => "another"),
      // Para Testar o Alerta de Erro ao Carregar
      // Future.delayed(const Duration(seconds: 3), () => throw "errorAlertTest"),
    ]).then((result) {
      // ----------------------------------------------------------------------- Success
      print(result);
    }).catchError((error, stack) {
      // ----------------------------------------------------------------------- Error
      print(error);
    }).whenComplete(() {
      // ----------------------------------------------------------------------- Finally
      print("finally");
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                width: _size,
                height: _size,
                child: const CircularProgressIndicator(),
              ),
              Positioned(
                width: _size,
                height: _size,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Image.asset(
                    Assets.images.logos.flutter,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

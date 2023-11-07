import 'package:provaflutter/import_collections.dart';
import 'package:provaflutter/providers/providers_app_state.dart';

class $PagesSplashScreen extends StatefulWidget {
  const $PagesSplashScreen({super.key});

  @override
  State<$PagesSplashScreen> createState() => _$PagesSplashScreenState();
}

class _$PagesSplashScreenState extends State<$PagesSplashScreen> with TickerProviderStateMixin {
  final double _size = 180;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void deactivate() {
    super.deactivate();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    final appState = context.read<ProvidersAppState>();
    // ------------------------------------------------------------------------- Initialize
    if (appState.isInitialized == false) {
      appState.initialize([
        // --------------------------------------------------------------------- List Dependencies
        Future.delayed(const Duration(seconds: 2), () => "firebase"),
        Future.delayed(const Duration(seconds: 1), () => "another"),
        // Para Testar o Alerta de Erro ao Carregar
        // Future.delayed(const Duration(seconds: 3), () => throw "errorAlertTest"),
      ]);
    } else {
      appState.restart();
    }
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
                  child: RotationTransition(
                    turns: _animation,
                    child: Image.asset(
                      Assets.images.logos.flutter,
                      color: Theme.of(context).colorScheme.primary,
                    ),
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

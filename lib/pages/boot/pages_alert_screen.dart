import 'package:provaflutter/import_collections.dart';

class $PagesAlertScreen extends StatelessWidget {
  const $PagesAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.read<ProvidersAppState>();
    final foregroundColor = Theme.of(context).colorScheme.onError;
    final overlayColor = Colors.red.shade300;
    final color = Colors.red.shade200;
    const double size = 180;

    return Scaffold(
      body: Components.bodyGradient(
        startColor: Theme.of(context).colorScheme.onError,
        endColor: Theme.of(context).colorScheme.error,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: size,
                height: size,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    // --------------------------------------------------------- Flutter Logo Image
                    Positioned(
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        width: size,
                        height: size,
                        child: Image.asset(
                          Assets.images.logos.flutter,
                          color: color,
                        ),
                      ),
                    ),
                    // --------------------------------------------------------- Error Title
                    Positioned(
                      left: 30,
                      bottom: 35,
                      child: Text(
                        Languages.current.error,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // --------------------------------------------------------------- Try Again Button
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(foregroundColor),
                  overlayColor: MaterialStatePropertyAll(overlayColor),
                  backgroundColor: MaterialStatePropertyAll(color),
                ),
                onPressed: () => appState.restart(),
                child: Text(Languages.current.tryAgain),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

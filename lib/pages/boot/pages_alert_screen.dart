import 'package:provaflutter/import_collections.dart';

class $PagesAlertScreen extends StatelessWidget {
  const $PagesAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double size = 180;

    return Scaffold(
      body: SafeArea(
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
                    Positioned(
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        width: size,
                        height: size,
                        child: Image.asset(
                          Assets.images.logos.flutter,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      bottom: 35,
                      child: Text(
                        Languages.current.error,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                    Theme.of(context).scaffoldBackgroundColor,
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.error,
                  ),
                  overlayColor: MaterialStatePropertyAll(
                    Colors.red.shade700,
                  )
                ),
                onPressed: () {

                  // ----------------------------------------------------------- Function Try Again

                },
                child: Text(
                  Languages.current.tryAgain,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

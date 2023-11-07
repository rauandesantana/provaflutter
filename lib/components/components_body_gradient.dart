import 'package:provaflutter/import_collections.dart';

class $ComponentsBodyGradient extends StatelessWidget {
  const $ComponentsBodyGradient({
    super.key,
    required this.startColor,
    required this.endColor,
    required this.child,
  });

  final Color? startColor;
  final Color? endColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: double.infinity,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              startColor ?? Theme.of(context).colorScheme.background,
              endColor ?? Theme.of(context).colorScheme.onBackground,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: child,
      ),
    );
  }
}

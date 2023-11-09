import 'package:provaflutter/import_collections.dart';

class $ComponentesBlockScreen extends StatelessWidget {
  const $ComponentesBlockScreen({
    super.key,
    required this.isBlocked,
    required this.child,
  });

  final bool? isBlocked;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        Visibility(
          visible: isBlocked ?? false,
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}

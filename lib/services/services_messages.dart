import 'package:provaflutter/import_collections.dart';

// ============================================================================= Services Messages
class $ServicesMessages {
  const $ServicesMessages();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Show Snack Bar
  void showSnackBar({
    required BuildContext context,
    required String text,
    Color? color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color ?? Theme.of(context).colorScheme.error,
        content: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------------------------------- Show Bottom Sheet
  void showBottomSheet({
    required BuildContext context,
    required Widget child,
}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) => child,
    );
  }
}

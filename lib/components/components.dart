import 'package:provaflutter/components/components_body_gradient.dart';
import 'package:provaflutter/import_collections.dart';

// ============================================================================= Components
class Components {
  const Components();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Body Gradient
  static Widget bodyGradient({
    Color? startColor,
    Color? endColor,
    required Widget child,
  }) {
    return $ComponentsBodyGradient(
      startColor: startColor,
      endColor: endColor,
      child: child,
    );
  }
}

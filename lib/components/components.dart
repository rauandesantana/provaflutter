import 'package:provaflutter/components/components_body_gradient.dart';
import 'package:provaflutter/components/components_text_form_field.dart';
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

  // --------------------------------------------------------------------------- Text Form Field
  static Widget textFormField({
    TextEditingController? controller,
    String? title,
    IconData? prefixIcon,
    double? prefixSizeIcon,
    bool? obscureText,
    List<TextInputFormatter>? inputFormatters,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
  }) {
    return $ComponentsTextFormField(
      controller: controller,
      title: title,
      prefixIcon: prefixIcon,
      prefixSizeIcon: prefixSizeIcon,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
    );
  }
}

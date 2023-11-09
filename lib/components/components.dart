import 'package:provaflutter/components/components_body_gradient.dart';
import 'package:provaflutter/components/components_bottom_sheet.dart';
import 'package:provaflutter/components/components_text_form_field.dart';
import 'package:provaflutter/components/components_text_item.dart';
import 'package:provaflutter/components/components_text_list.dart';
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
    String? hintText,
    IconData? prefixIcon,
    double? prefixSizeIcon,
    bool? obscureText,
    List<TextInputFormatter>? inputFormatters,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    FormFieldValidator<String>? validator,
    TextAlign? textAlign,
  }) {
    return $ComponentsTextFormField(
      controller: controller,
      title: title,
      hintText: hintText,
      prefixIcon: prefixIcon,
      prefixSizeIcon: prefixSizeIcon,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: validator,
      textAlign: textAlign,
    );
  }

  // --------------------------------------------------------------------------- Text List
  static Widget textList({
    double? width,
    double? height,
    required List<Map<String, dynamic>> textList,
    required NullableIndexedWidgetBuilder itemBuilder,
  }) {
    return $ComponentsTextList(
      width: width,
      height: height,
      textList: textList,
      itemBuilder: itemBuilder,
    );
  }

  // --------------------------------------------------------------------------- Text List
  static Widget textItem({
    required int index,
    required String text,
    required bool editMode,
    required bool deleteMode,
    required void Function(int) editAction,
    required void Function(int) deleteAction,
  }) {
    return $ComponentsTextItem(
      index: index,
      text: text,
      editMode: editMode,
      deleteMode: deleteMode,
      editAction: editAction,
      deleteAction: deleteAction,
    );
  }

  // --------------------------------------------------------------------------- Bottom Sheet
  static Widget bottomSheet({
    bool? persistent,
    double? height,
    VoidCallback? onWillPop,
    required VoidCallback? cancelAction,
    required VoidCallback? confirmAction,
    required List<Widget> children,
  }) {
    return $ComponentsBottomSheet(
      persistent: persistent,
      height: height,
      onWillPop: onWillPop,
      cancelAction: cancelAction,
      confirmAction: confirmAction,
      children: children,
    );
  }
}

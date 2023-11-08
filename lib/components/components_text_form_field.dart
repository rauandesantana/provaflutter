import 'package:provaflutter/import_collections.dart';

class $ComponentsTextFormField extends StatelessWidget {
  const $ComponentsTextFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    required this.prefixIcon,
    required this.prefixSizeIcon,
    required this.obscureText,
    required this.inputFormatters,
    required this.textInputAction,
    required this.keyboardType,
    required this.validator,
    required this.textAlign,
  });

  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final IconData? prefixIcon;
  final double? prefixSizeIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title != null,
          child: Padding(
            padding: const EdgeInsets.only(left: 7, right: 7, bottom: 3),
            child: Text(title ?? ""),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          keyboardType: keyboardType ?? TextInputType.text,
          validator: validator,
          textAlign: textAlign ?? TextAlign.start,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: (prefixIcon != null)
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(prefixIcon, size: prefixSizeIcon),
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(
              maxWidth: double.maxFinite,
              maxHeight: double.maxFinite,
            ),
          ),
        ),
      ],
    );
  }
}

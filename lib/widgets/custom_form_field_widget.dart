import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final int maxLines;

  const CustomFormField(
      {Key? key,
      required this.controller,
      required this.validator,
      this.hintText = '',
      this.hintStyle,
      this.style,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      cursorColor: CMColors.primary,
      style: style ?? TextStyle(color: CMColors.primary),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? CMTextStyles.createUserPlaceholder,
          contentPadding: const EdgeInsets.all(18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
      validator: validator,
      maxLines: maxLines,
    );
  }
}

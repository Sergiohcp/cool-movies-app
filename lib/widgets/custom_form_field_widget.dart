import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;

  const CustomFormField(
      {Key? key,
      required this.controller,
      this.hintText,
      required this.validator,
      this.obscureText = false,
      this.suffixIcon,
      this.hintStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      cursorColor: CMColors.primary,
      style: TextStyle(color: CMColors.primary),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? CMTextStyles.createUserPlaceholder,
          contentPadding: const EdgeInsets.all(18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
      validator: validator,
    );
  }
}

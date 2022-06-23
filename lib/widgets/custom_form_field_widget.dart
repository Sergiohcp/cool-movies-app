import 'package:coolmovies/core/cm_colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomFormField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.validator,
      this.obscureText = false,
      this.suffixIcon})
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
        hintStyle: TextStyle(
          color: CMColors.grayDark,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: CMColors.gray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: CMColors.primary, width: 1.5),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      obscureText: obscureText,
    );
  }
}

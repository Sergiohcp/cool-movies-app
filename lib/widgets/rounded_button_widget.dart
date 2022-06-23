import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final bool isLoading;

  const RoundedButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.width = 200,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CMColors.primary,
        onPrimary: CMColors.secondary,
        fixedSize: Size(width, 42),
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        elevation: 2,
      ),
      onPressed: onTap,
      child: !isLoading
          ? Text(
              text,
              style: CMTextStyles.roundedButtonText,
            )
          : Container(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(
                  color: CMColors.white, strokeWidth: 2),
            ),
    );
  }
}

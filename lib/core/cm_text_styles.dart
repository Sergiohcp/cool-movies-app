import 'package:coolmovies/core/cm_colors.dart';
import 'package:flutter/material.dart';

class CMTextStyles {
  static final TextStyle createUserTitle = TextStyle(
    color: CMColors.grayDarker,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle createUserPlaceholder = TextStyle(
    color: CMColors.grayDark,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle roundedButtonText = TextStyle(
    color: CMColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle listMoviesAppBar = TextStyle(
    color: CMColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
}

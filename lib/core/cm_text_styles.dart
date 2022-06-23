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

  static final TextStyle listMovieItemTitle = TextStyle(
    color: CMColors.grayDarker,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle movieDetailsTitle = TextStyle(
    color: CMColors.white,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    shadows: <Shadow>[
      Shadow(offset: Offset(2, 2), blurRadius: 3.0, color: CMColors.grayDark),
      Shadow(offset: Offset(2, 2), blurRadius: 8.0, color: CMColors.grayDarker),
    ],
  );

  static final TextStyle movieDetailsReleaseDate = TextStyle(
    color: CMColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle movieDetailsReviews = TextStyle(
    color: CMColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle reviewUserName = TextStyle(
    color: CMColors.grayDark,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle reviewTitle = TextStyle(
    color: CMColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle reviewBody = TextStyle(
    color: CMColors.grayDark,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle reviewEditButton = TextStyle(
    color: CMColors.secondary,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}

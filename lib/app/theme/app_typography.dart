import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTypography {
  static const String serifFontFamily = 'DFVN Simple Serenity Serif';

  static TextTheme textTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontFamily: serifFontFamily,
        fontSize: 72,
        fontWeight: FontWeight.w400,
        height: 0.98,
        letterSpacing: -2.0,
        color: AppColors.foreground,
      ),
      displayMedium: TextStyle(
        fontFamily: serifFontFamily,
        fontSize: 56,
        fontWeight: FontWeight.w400,
        height: 1.0,
        letterSpacing: -1.5,
        color: AppColors.foreground,
      ),
      headlineLarge: TextStyle(
        fontFamily: serifFontFamily,
        fontSize: 42,
        fontWeight: FontWeight.w400,
        height: 1.05,
        letterSpacing: -1.0,
        color: AppColors.foreground,
      ),
      headlineMedium: TextStyle(
        fontFamily: serifFontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 1.1,
        color: AppColors.foreground,
      ),
      titleLarge: TextStyle(
        fontFamily: serifFontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.15,
        color: AppColors.foreground,
      ),
      bodyLarge: TextStyle(
        fontFamily: serifFontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.foreground,
      ),
      bodyMedium: TextStyle(
        fontFamily: serifFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.foreground,
      ),
      bodySmall: TextStyle(
        fontFamily: serifFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColors.foreground,
      ),
      labelLarge: TextStyle(
        fontFamily: serifFontFamily,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.8,
        color: AppColors.foreground,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData light() {
    final ThemeData baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.accent,
        onPrimary: Colors.white,
        surface: AppColors.surface,
        onSurface: AppColors.foreground,
        outline: AppColors.border,
      ),
      textTheme: AppTypography.textTheme(),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(120, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

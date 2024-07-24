import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_padding.dart';
import 'app_radius.dart';

class AppThemes {
  static final ThemeData lighTheme =
      ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true).copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor, scrolledUnderElevation: 0),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: AppPadding.paddingA20,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.borderColor, width: 3),
        borderRadius: AppRadius.radiusC10,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gradient2, width: 3),
        borderRadius: AppRadius.radiusC10,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.errorColor, width: 3),
        borderRadius: AppRadius.radiusC10,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gradient2, width: 3),
        borderRadius: AppRadius.radiusC10,
      ),
    ),
  );
}

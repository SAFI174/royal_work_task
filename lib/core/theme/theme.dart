import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_padding.dart';
import 'app_radius.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
    colorSchemeSeed: Colors.blue,
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
  ).copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparentColor, scrolledUnderElevation: 0),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: AppPadding.paddingA20,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.greyColor, width: 3),
        borderRadius: AppRadius.radiusC10,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gradient1, width: 3),
        borderRadius: AppRadius.radiusC10,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.errorColor, width: 3),
        borderRadius: AppRadius.radiusC10,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gradient1, width: 3),
        borderRadius: AppRadius.radiusC10,
      ),
    ),
  );
}

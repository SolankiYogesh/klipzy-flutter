import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klikli/helpers/app_colors.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: AppColors.themeBackground,
    ),
    scaffoldBackgroundColor: AppColors.dark1E,
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: AppColors.whiteShadeFA),
      titleMedium: TextStyle(color: AppColors.black),
      titleLarge: TextStyle(color: AppColors.grayrg),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.dark1E),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: AppColors.themeBackground),
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: AppColors.whiteShadeFA,
    ),
    scaffoldBackgroundColor: AppColors.whiteShadeFA,
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: AppColors.black),
      titleMedium: TextStyle(color: AppColors.grayShadeCC),
      titleLarge: TextStyle(color: AppColors.grayShade84),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.grayShade84),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: AppColors.whiteShadeFA),
    ),
  );
}

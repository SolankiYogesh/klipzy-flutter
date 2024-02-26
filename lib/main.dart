import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:klikli/screens/splash_screen/splash_screen.dart';
import 'package:klikli/theme/app_theme.dart';
import 'package:klikli/theme/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final ThemeService themeService = ThemeService();
  final initialTheme = await themeService.getThemeMode();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    log(details.toString());
  };
  runApp(MyApp(initialTheme: initialTheme));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialTheme});
  final ThemeMode initialTheme;

  @override
  Widget build(BuildContext context) {
    final initTheme = initialTheme == ThemeMode.dark
        ? AppTheme.darkTheme
        : AppTheme.lightTheme;

    return ThemeProvider(
      duration: const Duration(milliseconds: 500),
      initTheme: initTheme,
      builder: (p0, theme) {
        return GetMaterialApp(
          transitionDuration: const Duration(seconds: 2),
          defaultTransition: Transition.circularReveal,
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          theme: theme,
          home: const SplashScreen(),
        );
      },
    );
  }
}

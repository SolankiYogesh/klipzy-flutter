import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ThemeService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _key = 'isThemeMode';

  Future<ThemeMode> getThemeMode() async {
    final prefs = await _prefs;
    return prefs.getBool(_key) == true ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await _prefs;
    await prefs.setBool(_key, themeMode == ThemeMode.dark);
    Get.changeThemeMode(themeMode);
  }

  void switchTheme() async {
    final currentThemeMode = await getThemeMode();
    final newThemeMode =
        currentThemeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(newThemeMode);
  }
}

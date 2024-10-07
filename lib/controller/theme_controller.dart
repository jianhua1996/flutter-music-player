import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class ThemeController extends GetxController {
  static final lightTheme = theme(MaterialTheme.lightScheme());
  static final darkTheme = theme(MaterialTheme.darkScheme());

  var currentTheme = lightTheme.obs;

  bool get isDarkMode => currentTheme.value == darkTheme;

  void toggleTheme() {
    currentTheme.value = isDarkMode ? lightTheme : darkTheme;
  }

  static ThemeData theme(ColorScheme colorScheme) => ThemeData(
        colorScheme: colorScheme,
        fontFamily: 'Harmony',
      );
}

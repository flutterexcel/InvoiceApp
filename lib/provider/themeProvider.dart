// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:invoice_maker/customWidgets/customFunctions.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeMode themeMode;

  ThemeProvider(String theme) {
    if (theme == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
  }

  void toggleTheme() async {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      await saveTheme("dark");
    } else {
      themeMode = ThemeMode.light;
      await saveTheme("light");
    }

    notifyListeners();
  }
}

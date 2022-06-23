import 'package:flutter/material.dart';
import 'package:weather/theme/color.dart';

class WeatherTheme extends ChangeNotifier {
  ThemeData _currentTheme = lightTheme; // initial theme

  getTheme() => _currentTheme; // getting the current state of a theme

  // theme change
  setTheme() async {
    if (_currentTheme == lightTheme) {
      _currentTheme = darkTheme;
    } else {
      _currentTheme = lightTheme;
    }
    notifyListeners();
  }

  // light theme
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(primary: WeatherColors.light),
      appBarTheme: const AppBarTheme(backgroundColor: WeatherColors.light),
    );
  }

  // dark theme
  static ThemeData get darkTheme {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(primary: WeatherColors.blueGrey),
      appBarTheme: const AppBarTheme(backgroundColor: WeatherColors.blueGrey),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather/theme/color.dart';

final lightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(primary: WeatherColors.light),
  appBarTheme: const AppBarTheme(backgroundColor: WeatherColors.light),
);

// final darkTheme = ThemeData.light().copyWith(
//   // textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.black)),
//     scaffoldBackgroundColor: Example.darkYellow2,
//     appBarTheme: const AppBarTheme(backgroundColor: Example.darkYellow),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: Example.darkYellow,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.black45,
//     ));

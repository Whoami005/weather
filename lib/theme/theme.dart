import 'package:flutter/material.dart';
import 'package:weather/theme/color.dart';

final lightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(primary: WeatherColors.light),
  appBarTheme: const AppBarTheme(backgroundColor: WeatherColors.light),
);
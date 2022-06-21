import 'package:flutter/material.dart';
import 'package:weather/theme/color.dart';
import 'package:weather/theme/text_style.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: WeatherTextStyle.title16bold(WeatherColors.black));
  }
}

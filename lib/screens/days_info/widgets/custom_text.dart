import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather/theme/color.dart';
import 'package:weather/theme/text_style.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: WeatherTextStyle.title16bold(WeatherColors.black),
      maxLines: 1,
      maxFontSize: 14,
    );
  }
}

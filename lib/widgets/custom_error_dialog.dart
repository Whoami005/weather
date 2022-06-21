import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/theme/color.dart';
import 'package:weather/theme/text_style.dart';

class CustomErrorDialog {
  static Future<void> show({
    required BuildContext context,
    required String errorMessage,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.sms_failed,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Ошибка получения данных",
                    style: WeatherTextStyle.title16bold(WeatherColors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                errorMessage,
                style: WeatherTextStyle.title16bold(Colors.red),
              ),
            ],
          ),
        );
      },
    );
  }
}

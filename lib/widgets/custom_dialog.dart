import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/theme/color.dart';
import 'package:weather/theme/text_style.dart';

//showDialog called on empty field
class CustomDialog extends StatelessWidget {
  static void show({
    required BuildContext context,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Text(
                "Поле должно быть заполнено",
                style: WeatherTextStyle.title18bold(WeatherColors.black),
              ),
            ),
          ),
        );
      },
    );
  }

  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

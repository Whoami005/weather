import 'package:flutter/material.dart';
import 'package:weather/screens/weather/bloc/weather_cubit.dart';
import 'package:weather/theme/text_style.dart';

class InfoCard extends StatelessWidget {
  final WeatherState state;
  final String? image;
  final String? text;
  final String? textTwo;
  final String? textThree;

  const InfoCard({
    Key? key,
    required this.state,
    this.image,
    this.text,
    this.textTwo,
    this.textThree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (image!.isNotEmpty)
              Center(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset(image!),
                ),
              ),
            const SizedBox(height: 10),
            Text(
              text ?? '-',
              style: WeatherTextStyle.title16bold(Colors.black),
            ),
            Text(
              textTwo ?? '-',
              style: WeatherTextStyle.title16bold(Colors.black),
            ),
            Text(
              textThree ?? '-',
              style: WeatherTextStyle.title16bold(Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

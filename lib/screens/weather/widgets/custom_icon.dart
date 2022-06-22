import 'package:flutter/material.dart';
import 'package:weather/models/weatherCity.dart';

// checking the weather condition to show the desired icon
class CustomIcon extends StatelessWidget {
  final WeatherCity? _weatherCity;

  const CustomIcon({
    Key? key,
    required weatherCity,
  })  : _weatherCity = weatherCity,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        if (_weatherCity!.weather![0].main! == "Clouds")
          Image.asset("assets/cloudy.png"),
        if (_weatherCity!.weather![0].main! == "Clear")
          Image.asset("assets/rainbow.png"),
        if (_weatherCity!.weather![0].main! == "Drizzle")
          Image.asset("assets/drizzle.png"),
        if (_weatherCity!.weather![0].main! == "Rain")
          Image.asset("assets/rain.png"),
        if (_weatherCity!.weather![0].main! == "Thunderstorm")
          Image.asset("assets/sunny.png"),
        if (_weatherCity!.weather![0].main! == "Snow")
          Image.asset("assets/snow.png"),
      ],
    );
  }
}

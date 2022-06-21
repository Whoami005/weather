import 'package:flutter/material.dart';
import 'package:weather/screens/weather/bloc/weather_cubit.dart';

class CustomIcon extends StatelessWidget {
  final WeatherState state;

  const CustomIcon({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        if (state.weatherCity!.weather![0].main! == "Clouds")
          Image.asset("assets/cloudy.png"),
        if (state.weatherCity!.weather![0].main! == "Clear")
          Image.asset("assets/rainbow.png"),
        if (state.weatherCity!.weather![0].main! == "Drizzle")
          Image.asset("assets/drizzle.png"),
        if (state.weatherCity!.weather![0].main! == "Rain")
          Image.asset("assets/rain.png"),
        if (state.weatherCity!.weather![0].main! == "Thunderstorm")
          Image.asset("assets/sunny.png"),
        if (state.weatherCity!.weather![0].main! == "Snow")
          Image.asset("assets/snow.png"),
      ],
    );
  }
}

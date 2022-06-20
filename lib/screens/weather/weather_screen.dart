import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/weather/bloc/weather_cubit.dart';

class WeatherScreen extends StatelessWidget {
  final String city;

  const WeatherScreen({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state.status == WeatherStatus.initial) {
            context.read<WeatherCubit>().getWeather(city: city);
          }
          if (state.status == WeatherStatus.loaded) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      Text(state.weather!.weather![0].description!),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/screens/home/home_screen.dart';
import 'package:weather/screens/weather/bloc/weather_cubit.dart';
import 'package:weather/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(),
      child: BlocProvider(
        create: (BuildContext context) =>
            WeatherCubit(repository: WeatherRepository()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: HomeScreen(),
        ),
      ),
    );
  }
}

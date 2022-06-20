import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/screens/bloc/home_cubit.dart';
import 'package:weather/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ,
      home: RepositoryProvider(
        create: (context) => WeatherRepository(),
        child: BlocProvider(
          create: (BuildContext context) =>
              HomeCubit(repository: WeatherRepository()),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}

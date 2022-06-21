import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/repositories/days_info_repository.dart';
import 'package:weather/repositories/today_repository.dart';
import 'package:weather/screens/home/bloc/home_cubit.dart';
import 'package:weather/screens/home/home_screen.dart';
import 'package:weather/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (BuildContext context) => TodayRepository(),
        ),
        RepositoryProvider(
          create: (BuildContext context) => DaysInfoRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => HomeCubit())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}

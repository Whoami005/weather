import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/bloc/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.initial) {
            context.read<HomeCubit>().getWeather(city: 'Москва');
          }
          if (state.status == HomeStatus.loaded) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      const TextField(
                          // controller: ,
                          ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Поиск"))
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

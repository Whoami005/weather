import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/screens/weather/bloc/weather_cubit.dart';
import 'package:weather/screens/weather/widgets/custom_icon.dart';
import 'package:weather/screens/weather/widgets/info_card.dart';
import 'package:weather/theme/text_style.dart';
import 'package:weather/widgets/custom_error_dialog.dart';

class WeatherScreen extends StatelessWidget {
  final String city;

  const WeatherScreen({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          WeatherCubit(repository: WeatherRepository()),
      child: Scaffold(
        body: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (weatherContext, weatherState) {
            if (weatherState.status == WeatherStatus.errorServer) {
              Navigator.pop(context);
              CustomErrorDialog.show(
                context: context,
                errorMessage: weatherState.errorMessage!,
              );
            }
          },
          builder: (context, state) {
            if (state.status == WeatherStatus.initial) {
              context.read<WeatherCubit>().getWeather(city: city);
            }
            if (state.status == WeatherStatus.loaded) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("${state.weatherCity!.name!}, "
                      "${state.weatherCity!.sys!.country!}"),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      iconSize: 60,
                      onPressed: () {},
                      icon: Image.asset("assets/sunny.png"),
                      splashRadius: 30,
                    )
                  ],
                ),
                body: SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<WeatherCubit>().getWeather(city: city);
                    },
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIcon(state: state),
                          const SizedBox(height: 10),
                          Text(
                            state.weatherCity!.weather![0].main!,
                            style: WeatherTextStyle.title30(Colors.black),
                          ),
                          const SizedBox(height: 20),
                          Card(
                            child: Row(
                              children: [
                                Image.network(
                                  "http://openweathermap.org/img/wn/"
                                  "${state.weatherCity!.weather![0].icon!}@2x.png",
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  state.weatherCity!.weather![0].description!,
                                  style: WeatherTextStyle.title25bold(
                                    Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InfoCard(
                            state: state,
                            image: "assets/very_sunny.png",
                            text: "Температура: "
                                "${state.weatherCity!.main!.temp}",
                            textThree: "Max температура: "
                                "${state.weatherCity!.main!.tempMax}",
                            textTwo: "Min температура: "
                                "${state.weatherCity!.main!.tempMin}",
                          ),
                          InfoCard(
                            state: state,
                            image: "assets/wind.png",
                            text: "Скорость ветра: "
                                "${state.weatherCity!.wind!.speed}",
                            textTwo: "Порыв ветра: "
                                "${state.weatherCity!.wind!.gust}",
                            textThree: "Направление ветра: "
                                "${state.weatherCity!.wind!.deg}°",
                          ),
                          InfoCard(
                            state: state,
                            image: "assets/ice.png",
                            text: "Видимость: "
                                "${state.weatherCity!.visibility!} km",
                            textTwo: "Облачность: "
                                "${state.weatherCity!.clouds!.all}%",
                            textThree: "Влажность: "
                                "${state.weatherCity!.main!.humidity}%",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

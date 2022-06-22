import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/repositories/today_repository.dart';
import 'package:weather/screens/weather/bloc/weather_cubit.dart';
import 'package:weather/screens/weather/widgets/app_bar.dart';
import 'package:weather/screens/weather/widgets/custom_icon.dart';
import 'package:weather/screens/weather/widgets/info_card.dart';
import 'package:weather/theme/color.dart';
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
          WeatherCubit(repository: TodayRepository()),
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
                appBar: WeatherAppBar(
                  weatherCity: state.weatherCity,
                  city: city,
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
                          CustomIcon(weatherCity: state.weatherCity),
                          const SizedBox(height: 10),
                          Text(
                            state.weatherCity!.weather![0].main!,
                            style: WeatherTextStyle.title30bold(
                              WeatherColors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Card(
                            child: Row(
                              children: [
                                Image.network(
                                  "http://openweathermap.org/img/wn/"
                                  "${state.weatherCity!.weather![0].icon!}"
                                  "@2x.png",
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 200,
                                  child: AutoSizeText(
                                    state.weatherCity!.weather![0].description!,
                                    style: WeatherTextStyle.title25bold(
                                      WeatherColors.black54,
                                    ),
                                    maxLines: 2,
                                    minFontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InfoCard(
                            image: "assets/very_sunny.png",
                            text: "Температура: "
                                "${state.weatherCity!.main!.temp}",
                            textThree: "Max температура: "
                                "${state.weatherCity!.main!.tempMax}",
                            textTwo: "Min температура: "
                                "${state.weatherCity!.main!.tempMin}",
                          ),
                          InfoCard(
                            image: "assets/wind.png",
                            text: "Скорость ветра: "
                                "${state.weatherCity!.wind!.speed}",
                            textTwo: "Порыв ветра: "
                                "${state.weatherCity!.wind!.gust}",
                            textThree: "Направление ветра: "
                                "${state.weatherCity!.wind!.deg}°",
                          ),
                          InfoCard(
                            image: "assets/ice.png",
                            text: "Видимость: "
                                "${state.weatherCity!.visibility} km",
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

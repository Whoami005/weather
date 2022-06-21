import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/repositories/days_info_repository.dart';
import 'package:weather/screens/days_info/bloc/days_info_cubit.dart';
import 'package:weather/theme/color.dart';
import 'package:weather/theme/text_style.dart';

class DaysInfoScreen extends StatelessWidget {
  final String city;

  const DaysInfoScreen({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (BuildContext context) => DaysInfoCubit(
          repository: DaysInfoRepository(),
        ),
        child: BlocBuilder<DaysInfoCubit, DaysInfoState>(
          builder: (context, state) {
            if (state.status == DaysInfoStatus.initial) {
              context.read<DaysInfoCubit>().getInfo(city: city);
            }
            if (state.status == DaysInfoStatus.loaded) {
              return SafeArea(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180,
                                height: 180,
                                child: Image.asset("assets/forecast.jpg"),
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${state.info![index].dtTxt}",
                                    style: WeatherTextStyle.title18bold(
                                      WeatherColors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Температура: "
                                    "${state.info![index].main!.temp}",
                                    style: WeatherTextStyle.title16bold(
                                      WeatherColors.black,
                                    ),
                                  ),
                                  Text(
                                    "Скорость ветра: "
                                    "${state.info![index].wind!.speed}",
                                    style: WeatherTextStyle.title16bold(
                                      WeatherColors.black,
                                    ),
                                  ),
                                  Text(
                                    "Видимость: "
                                    "${state.info![index].visibility}",
                                    style: WeatherTextStyle.title16bold(
                                      WeatherColors.black,
                                    ),
                                  ),
                                  Text(
                                    "Облачность: "
                                    "${state.info![index].clouds!.all}%",
                                    style: WeatherTextStyle.title16bold(
                                      WeatherColors.black,
                                    ),
                                  ),
                                  Text(
                                    "Влажность: "
                                    "${state.info![index].main!.humidity}%",
                                    style: WeatherTextStyle.title16bold(
                                      WeatherColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 3,
                      );
                    },
                    itemCount: state.info!.length),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

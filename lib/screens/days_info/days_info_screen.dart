import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/repositories/days_info_repository.dart';
import 'package:weather/screens/days_info/bloc/days_info_cubit.dart';
import 'package:weather/screens/days_info/widgets/app_bar.dart';
import 'package:weather/screens/days_info/widgets/custom_text.dart';
import 'package:weather/theme/color.dart';
import 'package:weather/theme/text_style.dart';

class DaysInfoScreen extends StatelessWidget {
  final String city;

  const DaysInfoScreen({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DaysInfoAppBar(),
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
                                  CustomText(
                                    text: "Температура: "
                                        "${state.info![index].main!.temp}",
                                  ),
                                  CustomText(
                                    text: "Скорость ветра: "
                                        "${state.info![index].wind!.speed}",
                                  ),
                                  CustomText(
                                    text: "Видимость: "
                                        "${state.info![index].visibility}",
                                  ),
                                  CustomText(
                                    text: "Облачность: "
                                        "${state.info![index].clouds!.all}%",
                                  ),
                                  CustomText(
                                    text: "Влажность: "
                                        "${state.info![index].main!.humidity}%",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(thickness: 3);
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

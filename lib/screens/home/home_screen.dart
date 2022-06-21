import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/home/bloc/home_cubit.dart';
import 'package:weather/screens/home/widgets/app_bar.dart';
import 'package:weather/screens/weather/weather_screen.dart';
import 'package:weather/theme/color.dart';
import 'package:weather/theme/text_style.dart';
import 'package:weather/widgets/custom_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const HomeAppBar(),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/home.jpg"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: WeatherColors.light, width: 5)),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "Махачкала",
                              hintStyle: WeatherTextStyle.title18bold(
                                Colors.black87,
                              ),
                              border: InputBorder.none),
                          style: WeatherTextStyle.title18bold(Colors.black87),
                          controller: state.cityController,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (state.cityController.text.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WeatherScreen(
                                    city: state.cityController.text,
                                  ),
                                ),
                              );
                            } else {
                              CustomDialog.show(context: context);
                            }
                          },
                          child: const Text("Поиск"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/screens/weather/weather_screen.dart';
import 'package:weather/theme/color.dart';
import 'package:weather/theme/text_style.dart';

class HomeScreen extends StatelessWidget {
  static void show({
    required BuildContext context,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Text(
                "Поле должно быть заполнено",
                style: WeatherTextStyle.title16bold(WeatherColors.black),
              ),
            ),
          ),
        );
      },
    );
  }

  final TextEditingController? controller = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Weather"),
        centerTitle: true,
      ),
      body: Scaffold(
        resizeToAvoidBottomInset: false,
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
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height,
                  ),
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
                              hintStyle: WeatherTextStyle.title16bold(
                                Colors.black87,
                              ),
                              border: InputBorder.none),
                          style: WeatherTextStyle.title16bold(Colors.black87),
                          controller: controller,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller!.text.isNotEmpty) {
                              Navigator.push(
                                context,
                                (MaterialPageRoute(
                                    builder: (context) =>
                                        WeatherScreen(city: controller!.text))),
                              );
                            } else {
                              HomeScreen.show(context: context);
                            }
                          },
                          child: const Text("Поиск"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

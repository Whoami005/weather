import 'package:flutter/material.dart';
import 'package:weather/models/weatherCity.dart';
import 'package:weather/screens/days_info/days_info_screen.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  final WeatherCity? _weatherCity;
  final String city;
  final double? height;

  const WeatherAppBar({
    Key? key,
    required WeatherCity? weatherCity,
    required this.city,
    this.height = kToolbarHeight,
  })  : _weatherCity = weatherCity,
        super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("${_weatherCity!.name!}, "
          "${_weatherCity!.sys!.country!}"),
      centerTitle: true,
      actions: [
        IconButton(
          iconSize: 60,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DaysInfoScreen(city: city),
              ),
            );
          },
          icon: Image.asset("assets/sunny.png"),
          splashRadius: 30,
        )
      ],
    );
  }
}

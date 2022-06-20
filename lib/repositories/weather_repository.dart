import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather.dart';

class WeatherRepository {
  final String _apiKey = "ae72b78a3620648f64652eaacc760dbe";

  Future<WeatherCity> fetch({required String city}) async {
    Uri url = Uri.parse(
      "http://api.openweathermap.org/data/2.5/"
      "weather?q=$city&lang=ru&APPID=$_apiKey",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final resultJson = jsonDecode(response.body);

      return WeatherCity.fromJson(resultJson);
    } else {
      return throw Exception("Ошибка получения данных");
    }
  }
}

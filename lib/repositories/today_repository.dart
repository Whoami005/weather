import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weatherCity.dart';

// query for current weather information
class TodayRepository {
  final String _apiKey = "ae72b78a3620648f64652eaacc760dbe";

  Future fetch({required String city}) async {
    Uri url = Uri.parse(
      "http://api.openweathermap.org/data/2.5/"
      "weather?q=$city&lang=ru&units=metric&APPID=$_apiKey",
    );
    final response = await http.get(url); // database query

    if (response.statusCode == 200) {
      final resultJson = jsonDecode(response.body); // serialization

      return WeatherCity.fromJson(resultJson); //json parsing
    } else {
      //error processing
      final resultJson = jsonDecode(response.body) as Map<String, dynamic>;

      return throw Exception(resultJson.values.last);
    }
  }
}

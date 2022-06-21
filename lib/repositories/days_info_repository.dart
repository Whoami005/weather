import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/info_days.dart';

class DaysInfoRepository {
  final String _apiKey = "ae72b78a3620648f64652eaacc760dbe";

  Future fetch({required String city}) async {
    Uri url = Uri.parse(
      "http://api.openweathermap.org/data/2.5/"
      "forecast?q=$city&lang=ru&units=metric&cnt=3&APPID=$_apiKey",
    );
    final response = await http.get(url); // database query

    if (response.statusCode == 200) {
      final resultJson = jsonDecode(response.body);
      List<Info> result = [];

      for (final map in resultJson["list"]) {
        result.add(Info.fromJson(map));
      }
      result.sort((a, b) {
        return a.main!.temp!.compareTo(b.main!.temp!);
      });

      return result;
    } else {
      //error processing
      final resultJson = jsonDecode(response.body) as Map<String, dynamic>;

      return throw Exception(resultJson.values.last);
    }
  }
}

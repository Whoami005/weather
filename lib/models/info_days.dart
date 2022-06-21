import 'package:weather/models/clouds.dart';
import 'package:weather/models/main_model.dart';
import 'package:weather/models/rain.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/models/wind.dart';

class Info {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  String? dtTxt;
  Rain? rain;

  Info({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.dtTxt,
    this.rain,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    final List<Weather> weather = [];
    json['weather'].forEach((weatherJson) {
      weather.add(Weather.fromJson(weatherJson));
    });
    return Info(
      dt: json['dt'],
      main: json['main'] != null ? Main.fromJson(json['main']) : null,
      weather: weather,
      clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      visibility: json['visibility'],
      dtTxt: json['dt_txt'],
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
    );
  }
}

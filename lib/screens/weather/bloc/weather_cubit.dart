import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository;

  WeatherCubit({required WeatherRepository repository})
      : _repository = repository,
        super(const WeatherState(status: WeatherStatus.initial));

  Future getWeather({required String city}) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    final response = await _repository.fetch(city: city);

    emit(state.copyWith(status: WeatherStatus.loaded, weather: response));
  }
}

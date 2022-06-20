import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/repositories/weather_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final WeatherRepository _repository;

  HomeCubit({required WeatherRepository repository})
      : _repository = repository,
        super(HomeState(status: HomeStatus.initial, weather: []));

  Future getWeather({required String city}) async{
    emit(state.copyWith(status: HomeStatus.loading));
    final response = await _repository.fetch(city: city);
    emit(state.copyWith(status: HomeStatus.loaded, weather: response));
  }
}

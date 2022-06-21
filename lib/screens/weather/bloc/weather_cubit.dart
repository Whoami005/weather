import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weatherCity.dart';
import 'package:weather/repositories/today_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final TodayRepository _repository;

  WeatherCubit({required TodayRepository repository})
      : _repository = repository,
        super(const WeatherState(status: WeatherStatus.initial));

  // getting weather information
  Future getWeather({required String city}) async {

    //get information about internet connection
    ConnectivityResult internet = await Connectivity().checkConnectivity();

    // have a network connection
    if (internet != ConnectivityResult.none) {
      try {
        emit(state.copyWith(status: WeatherStatus.loading));

        final response = await _repository.fetch(city: city); // database query

        emit(
          state.copyWith(
            status: WeatherStatus.loaded,
            weatherCity: response,
          ),
        );
      } catch (error) {  // server error
        emit(
          state.copyWith(
            status: WeatherStatus.errorServer,
            errorMessage: error.toString(),
          ),
        );
      }
    } else {  // no network connection
      emit(
        state.copyWith(
          status: WeatherStatus.errorServer,
          errorMessage: "Нет подключения к интернету",
        ),
      );
    }
  }
}

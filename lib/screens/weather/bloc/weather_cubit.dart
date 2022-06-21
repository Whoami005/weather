import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weatherCity.dart';
import 'package:weather/repositories/today_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final TodayRepository _repository;

  WeatherCubit({required TodayRepository repository})
      : _repository = repository,
        super(const WeatherState(status: WeatherStatus.initial));

  Future getWeather({required String city}) async {
    try {
      emit(state.copyWith(status: WeatherStatus.loading));

      final response = await _repository.fetch(city: city);

      emit(state.copyWith(status: WeatherStatus.loaded, weatherCity: response));
    } catch (error) {
      emit(
        state.copyWith(
          status: WeatherStatus.errorServer,
          errorMessage: error.toString(),
        ),
      );
      // emit(state.copyWith(status: WeatherStatus.initial));
    }
  }
}

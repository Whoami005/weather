part of 'weather_cubit.dart';

enum WeatherStatus {
  initial,
  loading,
  loaded,
  errorServer,
}

class WeatherState {
  final WeatherStatus _status;
  final WeatherCity? _weather;

  const WeatherState({
    required WeatherStatus status,
    WeatherCity? weather,
    TextEditingController? cityController,
  })  : _status = status,
        _weather = weather;

  WeatherCity? get weather => _weather;

  WeatherStatus get status => _status;

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherCity? weather,
    TextEditingController? cityController,
  }) {
    return WeatherState(
      status: status ?? _status,
      weather: weather ?? _weather,
    );
  }
}

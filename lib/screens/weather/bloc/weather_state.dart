part of 'weather_cubit.dart';

enum WeatherStatus {
  initial,
  loading,
  loaded,
  errorServer,
}

class WeatherState {
  final WeatherStatus _status;
  final WeatherCity? _weatherCity;
  final String? _errorMessage;

  const WeatherState({
    required WeatherStatus status,
    WeatherCity? weatherCity,
    String? errorMessage,
  })  : _status = status,
        _weatherCity = weatherCity,
        _errorMessage = errorMessage;

  String? get errorMessage => _errorMessage;

  WeatherCity? get weatherCity => _weatherCity;

  WeatherStatus get status => _status;

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherCity? weatherCity,
    String? errorMessage,
  }) {
    return WeatherState(
      status: status ?? _status,
      weatherCity: weatherCity ?? _weatherCity,
      errorMessage: errorMessage ?? _errorMessage,
    );
  }
}

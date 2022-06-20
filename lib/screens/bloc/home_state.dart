part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  errorServer,
}

class HomeState {
  final HomeStatus _status;
  final List<WeatherCity> _weather;
  final TextEditingController _cityController;

  HomeState({
    required HomeStatus status,
    required List<WeatherCity> weather,
    TextEditingController? cityController,
  })  : _status = status,
        _weather = weather,
        _cityController = cityController ?? TextEditingController();

  TextEditingController get cityController => _cityController;

  List<WeatherCity> get weather => _weather;

  HomeStatus get status => _status;

  HomeState copyWith({
    HomeStatus? status,
    List<WeatherCity>? weather,
    TextEditingController? cityController,
  }) {
    return HomeState(
      status: status ?? _status,
      weather: weather ?? _weather,
      cityController: cityController ?? _cityController,
    );
  }
}

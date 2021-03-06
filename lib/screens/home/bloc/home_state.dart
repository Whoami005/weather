part of 'home_cubit.dart';

// home screen states
enum HomeStatus {
  initial,
  loading,
  loaded,
}

class HomeState {
  final HomeStatus _status;
  final TextEditingController _cityController; // to get city name

  HomeState({
    required HomeStatus status,
    TextEditingController? cityController,
  })  : _status = status,
        _cityController = cityController ?? TextEditingController();

  TextEditingController get cityController => _cityController;

  HomeStatus get status => _status;

  HomeState copyWith({
    HomeStatus? status,
    TextEditingController? cityController,
  }) {
    return HomeState(
      status: status ?? _status,
      cityController: cityController ?? _cityController,
    );
  }
}

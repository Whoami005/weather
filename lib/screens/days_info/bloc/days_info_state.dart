part of 'days_info_cubit.dart';

enum DaysInfoStatus {
  initial,
  loading,
  loaded,
}

class DaysInfoState {
  final DaysInfoStatus _status;
  final List<Info>? _info;

  const DaysInfoState({
    required DaysInfoStatus status,
    List<Info>? info,
  })  : _status = status,
        _info = info;

  List<Info>? get info => _info;

  DaysInfoStatus get status => _status;

  DaysInfoState copyWith({
    DaysInfoStatus? status,
    List<Info>? info,
  }) {
    return DaysInfoState(
      status: status ?? _status,
      info: info ?? _info,
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/info_days.dart';
import 'package:weather/repositories/days_info_repository.dart';

part 'days_info_state.dart';

class DaysInfoCubit extends Cubit<DaysInfoState> {
  final DaysInfoRepository _repository;

  DaysInfoCubit({required DaysInfoRepository repository})
      : _repository = repository,
        super(const DaysInfoState(status: DaysInfoStatus.initial));

  Future getInfo({required String city}) async {
    emit(state.copyWith(status: DaysInfoStatus.loading));
    final response = await _repository.fetch(city: city);
    emit(state.copyWith(status: DaysInfoStatus.loaded, info: response));
  }
}

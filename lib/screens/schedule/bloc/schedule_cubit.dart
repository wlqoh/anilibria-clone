import 'package:anilibria_clone/models/article/article.dart';
import 'package:anilibria_clone/repositories/schedule.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit()
      : super(const ScheduleState(status: Status.initial, items: []));

  Future<void> fetch() async {
    if (state.status == Status.loading) return;
    emit(
      state.copyWith(
        status: Status.loading,
        items: [],
      ),
    );
    final response = await ScheduleListRepository().list();
    emit(
      state.copyWith(
        status: Status.loaded,
        items: response,
      ),
    );
  }
}
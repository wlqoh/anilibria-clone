import 'package:anilibria_clone/models/article/article.dart';
import 'package:anilibria_clone/repositories/schedule_today.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expected_today_state.dart';

class ExpectedTodayCubit extends Cubit<ExpectedTodayState> {
  ExpectedTodayCubit()
      : super(const ExpectedTodayState(status: Status.initial, items: []));

  Future<void> fetch() async {
    if (state.status == Status.loading) return;
    emit(
      state.copyWith(
        status: Status.loading,
        items: [],
      ),
    );
    final response = await ScheduleTodayListRepository().list();
    emit(
      state.copyWith(
        status: Status.loaded,
        items: response,
      ),
    );
  }
}

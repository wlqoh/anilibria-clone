part of 'schedule_cubit.dart';

enum Status {
  initial,
  loading,
  loaded,
  error,
}

class ScheduleState {
  final Status _status;
  final List<Main> _items;

  const ScheduleState({
    required Status status,
    required List<Main> items,
  })  : _status = status,
        _items = items;

  ScheduleState copyWith({
    Status? status,
    List<Main>? items,
  }) {
    return ScheduleState(
      status: status ?? _status,
      items: items ?? _items,
    );
  }

  Status get status => _status;

  List<Main> get items => _items;
}

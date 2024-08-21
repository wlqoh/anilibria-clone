part of 'expected_today_cubit.dart';

enum Status {
  initial,
  loading,
  loaded,
  error,
}

class ExpectedTodayState {
  final Status _status;
  final List<Article> _items;

  const ExpectedTodayState({
    required Status status,
    required List<Article> items,
  })  : _status = status,
        _items = items;

  ExpectedTodayState copyWith({
    Status? status,
    List<Article>? items,
  }) {
    return ExpectedTodayState(
      status: status ?? _status,
      items: items ?? _items,
    );
  }

  Status get status => _status;

  List<Article> get items => _items;
}

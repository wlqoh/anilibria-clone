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
  final ScrollController _controller;

  const ExpectedTodayState({
    required Status status,
    required List<Article> items,
    required ScrollController controller,
  })  : _status = status,
        _items = items,
        _controller = controller;

  ExpectedTodayState copyWith({
    Status? status,
    List<Article>? items,
    ScrollController? controller,
  }) {
    return ExpectedTodayState(
      status: status ?? _status,
      items: items ?? _items,
      controller: controller ?? _controller,
    );
  }

  Status get status => _status;

  List<Article> get items => _items;

  ScrollController get controller => _controller;
}

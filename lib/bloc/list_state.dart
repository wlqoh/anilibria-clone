part of 'list_cubit.dart';

@immutable
class ListState<T> {
  final StandardListStatus _status;
  final List<T> _items;
  final int _nextUrl;
  final bool _isPaginating;
  final ScrollController _controller;

  const ListState({
    required StandardListStatus status,
    required List<T> items,
    required int nextUrl,
    required bool isPaginating,
    required ScrollController controller,
  })  : _status = status,
        _items = items,
        _nextUrl = nextUrl,
        _isPaginating = isPaginating,
        _controller = controller;

  ListState<T> copyWith({
    StandardListStatus? status,
    List<T>? items,
    int? nextUrl,
    bool? isPaginating,
    ScrollController? controller,
  }) {
    return ListState(
      status: status ?? _status,
      items: items ?? _items,
      nextUrl: nextUrl ?? _nextUrl,
      isPaginating: isPaginating ?? _isPaginating,
      controller: controller ?? _controller,
    );
  }

  StandardListStatus get status => _status;

  List<T> get items => _items;

  int get nextUrl => _nextUrl;

  bool get isPaginating => _isPaginating;

  ScrollController get controller => _controller;
}

part of 'list_cubit.dart';

@immutable
class ListState<T> {
  final StandardListStatus _status;
  final List<T> _items;
  final int _nextUrl;
  final bool _isPaginating;
  final ScrollController _scrollController;
  final TextValue _textController;
  final bool _searching;

  const ListState({
    required StandardListStatus status,
    required List<T> items,
    required int nextUrl,
    required bool isPaginating,
    required ScrollController scrollController,
    required TextValue textController,
    required bool searching,
  })  : _status = status,
        _items = items,
        _nextUrl = nextUrl,
        _isPaginating = isPaginating,
        _scrollController = scrollController,
        _textController = textController,
        _searching = searching;

  ListState<T> copyWith({
    StandardListStatus? status,
    List<T>? items,
    int? nextUrl,
    bool? isPaginating,
    ScrollController? scrollController,
    TextValue? textController,
    bool? searching,
  }) {
    return ListState(
      status: status ?? _status,
      items: items ?? _items,
      nextUrl: nextUrl ?? _nextUrl,
      isPaginating: isPaginating ?? _isPaginating,
      scrollController: scrollController ?? _scrollController,
      textController: textController ?? _textController,
      searching: searching ?? _searching,
    );
  }

  StandardListStatus get status => _status;

  List<T> get items => _items;

  int get nextUrl => _nextUrl;

  bool get isPaginating => _isPaginating;

  ScrollController get scrollController => _scrollController;

  TextValue get textController => _textController;

  bool get searching => _searching;

}

class PaginatedResponse<T> {
  final List<T> _items;
  final int _page;
  final int _count;

  PaginatedResponse({
    required List<T> items,
    required int page,
    required int count,
  })  : _items = items,
        _page = page,
        _count = count;

  List<T> get items => _items;

  int get page => _page;

  int get count => _count;
}

import 'package:anilibria_clone/models/article/article.dart';
import 'package:dio/dio.dart';

class SearchRepository {
  final _url = '/title/search';

  Future<List<Article>> search(String text) async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.anilibria.tv/v3'));
    final response = await dio.get(_url + '?search=$text');
    final List<Article> items = [];
      for (final jsonItem in response.data['list']) {
        try {
          final item = Article.fromJson(jsonItem);
          items.add(item);
        } catch (error, stackTrace) {}

    }
    return items;
  }
}

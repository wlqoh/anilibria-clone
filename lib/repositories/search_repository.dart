// Project imports:
import 'package:anilibria_clone/models/article/article.dart';
import 'package:anilibria_clone/repositories/list_repository.dart';

class SearchListRepository extends ListRepository<Article> {
  static const _url = "title/updates";
  static const _urlFroItem = "title";

  SearchListRepository(super.backendApi);

  @override
  Article fromJson(Map<String, dynamic> json) {
    return Article.fromJson(json);
  }

  Future<Article> item({
    required int id,
  }) async {
    final response = await backendApi.get("$_urlFroItem?id=$id");
    try {
      return Article.fromJson(response.data);
    } catch (error, stackTrace) {
      printJsonDecodeError(error, stackTrace, response.data);
      rethrow;
    }
  }

  @override
  String urlList() {
    return _url;
  }
}

// Project imports:
import 'package:anilibria_clone/models/youtube.dart';
import 'package:anilibria_clone/repositories/list_repository.dart';

class YouTubeListRepository extends ListRepository<Youtube> {
  static const _url = "youtube";
  YouTubeListRepository(super.backendApi);

  @override
  Youtube fromJson(Map<String, dynamic> json) {
    return Youtube.fromJson(json);
  }

  @override
  String urlList() {
    return _url;
  }
}

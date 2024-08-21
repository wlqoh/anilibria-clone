// Project imports:
import 'package:anilibria_clone/models/article/article_names.dart';

class ArticleFranchises {
  final Franchise franchises;
  final List<Release> releases;

  ArticleFranchises({required this.franchises, required this.releases});

  factory ArticleFranchises.fromJson(Map<String, dynamic> json) {
    return ArticleFranchises(
      franchises: Franchise.fromJson(json['franchise']),
      releases: List<Release>.from(
        json["releases"].map((x) => Release.fromJson(x)),
      ),
    );
  }
}

class Franchise {
  final String? id;
  final String? name;

  Franchise({required this.id, required this.name});

  factory Franchise.fromJson(Map<String, dynamic> json) {
    return Franchise(id: json['id'], name: json['name']);
  }
}

class Release {
  final int id;
  final String? code;
  final int ordinal;
  final ArticleNames names;

  Release({
    required this.id,
    required this.code,
    required this.ordinal,
    required this.names,
  });

  factory Release.fromJson(Map<String, dynamic> json) {
    return Release(
      id: json['id'],
      code: json['code'],
      ordinal: json['ordinal'],
      names: ArticleNames.fromJson(json['names']),
    );
  }
}

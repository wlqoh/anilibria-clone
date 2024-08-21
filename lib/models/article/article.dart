import 'package:anilibria_clone/models/article/article_blocked.dart';
import 'package:anilibria_clone/models/article/article_franchises.dart';
import 'package:anilibria_clone/models/article/article_names.dart';
import 'package:anilibria_clone/models/article/article_player.dart';
import 'package:anilibria_clone/models/article/article_posters.dart';
import 'package:anilibria_clone/models/article/article_season.dart';
import 'package:anilibria_clone/models/article/article_status.dart';
import 'package:anilibria_clone/models/article/article_team.dart';
import 'package:anilibria_clone/models/article/article_torrents.dart';
import 'package:anilibria_clone/models/article/article_type.dart';

class Main {
  final int? day;
  final List<Article> list;

  Main({required this.day, required this.list});

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        day: json['day'],
        list: List<Article>.from(json['list'].map((x) => Article.fromJson(x))),
      );
}

class Article {
  final int id;
  final String? code;

  final ArticleNames names;
  final List<ArticleFranchises> franchises;
  final String? announce;

  final ArticleStatus status;
  final ArticlePosters posters;
  final int? updated;
  final int? lastChange;

  final ArticleType type;
  final List<String> genres;
  final ArticleTeam team;

  final ArticleSeason season;
  final String? description;
  final int inFavourites;

  final ArticleBlocked blocked;
  final ArticlePlayer player;

  final ArticleTorrents torrents;

  Article({
    required this.id,
    required this.code,
    required this.franchises,
    required this.announce,
    required this.updated,
    required this.lastChange,
    required this.description,
    required this.inFavourites,
    required this.status,
    required this.posters,
    required this.names,
    required this.type,
    required this.genres,
    required this.team,
    required this.player,
    required this.blocked,
    required this.season,
    required this.torrents,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    final List<String> genres = [];
    for (final item in json['genres']) {
      genres.add(item);
    }
    return Article(
      id: json['id'],
      code: json['code'],
      franchises: List<ArticleFranchises>.from(
        json["franchises"].map((x) => ArticleFranchises.fromJson(x)),
      ),
      announce: json['announce'],
      updated: json['updated'],
      lastChange: json['last_change'],
      description: json['description'],
      inFavourites: json['in_favorites'],
      status: ArticleStatus.fromJson(json['status']),
      posters: ArticlePosters.fromJson(json['posters']),
      names: ArticleNames.fromJson(json['names']),
      type: ArticleType.fromJson(json['type']),
      genres: genres,
      team: ArticleTeam.fromJson(json['team']),
      player: ArticlePlayer.fromJson(json['player']),
      blocked: ArticleBlocked.fromJson(json['blocked']),
      season: ArticleSeason.fromJson(json['season']),
      torrents: ArticleTorrents.fromJson(json['torrents']),
    );
  }
}

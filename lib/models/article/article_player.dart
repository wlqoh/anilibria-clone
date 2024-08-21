class ArticlePlayer {
  final dynamic alternativePlayer;
  final String? host;
  final bool? isRutube;
  final Episodes? episodes;
  final PlayerList list;
  final Rutube rutube;

  ArticlePlayer({
    required this.alternativePlayer,
    required this.host,
    required this.isRutube,
    required this.episodes,
    required this.list,
    required this.rutube,
  });

  factory ArticlePlayer.fromJson(Map<String, dynamic> json) {
    return ArticlePlayer(
      alternativePlayer: json['alternative_player'],
      host: json['host'],
      isRutube: json['is_rutube'],
      episodes: Episodes.fromJson(json['episodes']),
      list: PlayerList.fromJson(json['list']),
      rutube: Rutube.fromJson(json['rutube']),
    );
  }
}

class Episodes {
  final dynamic first;
  final dynamic last;
  final String? string;

  Episodes({
    required this.first,
    required this.last,
    required this.string,
  });

  factory Episodes.fromJson(Map<String, dynamic> json) {
    return Episodes(
      first: json['first'],
      last: json['last'],
      string: json['string'],
    );
  }
}

class PlayerList {
  final List<Episode> episodes;

  PlayerList({required this.episodes});

  factory PlayerList.fromJson(Map<String, dynamic> json) {
    final List<Episode> episodes = [];

    for (final key in json.keys) {
      episodes.add(Episode.fromJson(json[key]));
    }
    return PlayerList(episodes: episodes);
  }
}

class Episode {
  final dynamic episode;
  final String? name;
  final String? uuid;
  final int? createdTimestamp;
  final String? preview;
  final Skips skips;
  final Hls hls;

  Episode({
    required this.episode,
    required this.name,
    required this.uuid,
    required this.createdTimestamp,
    required this.preview,
    required this.skips,
    required this.hls,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      episode: json['episode'],
      name: json['name'],
      uuid: json['uuid'],
      createdTimestamp: json['created_timestamp'],
      preview: json['preview'],
      skips: Skips.fromJson(json['skips']),
      hls: Hls.fromJson(json['hls']),
    );
  }
}

class Hls {
  final String? fhd;
  final String? hd;
  final String? sd;

  Hls({
    required this.fhd,
    required this.hd,
    required this.sd,
  });

  factory Hls.fromJson(Map<String, dynamic> json) {
    return Hls(
      fhd: json['fhd'],
      hd: json['hd'],
      sd: json['sd'],
    );
  }
}

class Skips {
  final List opening;
  final List ending;

  Skips({required this.opening, required this.ending});

  factory Skips.fromJson(Map<String, dynamic> json) {
    final List opening = [];
    for (final item in json['opening']) {
      opening.add(item);
    }
    final List ending = [];
    for (final item in json['ending']) {
      ending.add(item);
    }
    return Skips(
      opening: opening,
      ending: ending,
    );
  }
}

class Rutube {
  Rutube();

  factory Rutube.fromJson(Map<String, dynamic> json) {
    return Rutube();
  }
}

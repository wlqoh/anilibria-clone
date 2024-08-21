// Project imports:
import 'package:anilibria_clone/models/article/article_player.dart';

class ArticleTorrents {
  final Episodes episodes;
  final List<TorrentsList> list;

  ArticleTorrents({
    required this.episodes,
    required this.list,
  });

  factory ArticleTorrents.fromJson(Map<String, dynamic> json) {
    final List<TorrentsList> list = [];

    for (final item in json['list']) {
      list.add(TorrentsList.fromJson(item));
    }
    return ArticleTorrents(
      episodes: Episodes.fromJson(json['episodes']),
      list: list,
    );
  }
}

class TorrentsList {
  final int torrentId;
  final Episodes episodes;
  final Quality quality;
  final int leechers;
  final int seeders;
  final int downloads;
  final int totalSize;
  final String? sizeString;
  final String? url;
  final String? magnet;
  final int uploadedTimestamp;
  final String? hash;
  final dynamic metadata;
  final dynamic rawBase64File;

  TorrentsList({
    required this.torrentId,
    required this.episodes,
    required this.quality,
    required this.leechers,
    required this.seeders,
    required this.downloads,
    required this.totalSize,
    required this.sizeString,
    required this.url,
    required this.magnet,
    required this.uploadedTimestamp,
    required this.hash,
    required this.metadata,
    required this.rawBase64File,
  });

  factory TorrentsList.fromJson(Map<String, dynamic> json) {
    return TorrentsList(
      torrentId: json["torrent_id"],
      episodes: Episodes.fromJson(json["episodes"]),
      quality: Quality.fromJson(json["quality"]),
      leechers: json["leechers"],
      seeders: json["seeders"],
      downloads: json["downloads"],
      totalSize: json["total_size"],
      sizeString: json["size_string"],
      url: json["url"],
      magnet: json["magnet"],
      uploadedTimestamp: json["uploaded_timestamp"],
      hash: json["hash"],
      metadata: json["metadata"],
      rawBase64File: json["raw_base64_file"],
    );
  }
}

class Quality {
  final String? string;
  final String? type;
  final String? resolution;
  final String? encoder;
  final String? lqAudio;

  Quality({
    required this.string,
    required this.type,
    required this.resolution,
    required this.encoder,
    required this.lqAudio,
  });

  factory Quality.fromJson(Map<String, dynamic> json) {
    return Quality(
      string: json['string'],
      type: json['type'],
      resolution: json['resolution'],
      encoder: json['encoder'],
      lqAudio: json['lq_audio'],
    );
  }
}

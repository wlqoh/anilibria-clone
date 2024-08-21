class ArticleBlocked {
  final bool? copyrights;
  final bool? geoip;
  final List geoipList;

  ArticleBlocked({
    required this.copyrights,
    required this.geoip,
    required this.geoipList,
  });

  factory ArticleBlocked.fromJson(Map<String, dynamic> json) {
    final List geoipList = [];
    for (final item in json['geoip_list']) {
      geoipList.add(item);
    }
    return ArticleBlocked(
      copyrights: json['copyrights'],
      geoip: json['geoip'],
      geoipList: geoipList,
    );
  }
}

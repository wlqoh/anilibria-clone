class ArticleType {
  final String? fullString;
  final int? code;
  final String? string;
  final int? episodes;
  final int? length;

  ArticleType({
    required this.fullString,
    required this.code,
    required this.string,
    required this.episodes,
    required this.length,
  });

  factory ArticleType.fromJson(Map<String, dynamic> json) {
    return ArticleType(
      fullString: json['full_string'],
      code: json['code'],
      string: json['string'],
      episodes: json['episodes'],
      length: json['length'],
    );
  }
}

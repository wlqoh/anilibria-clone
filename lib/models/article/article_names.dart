class ArticleNames {
  final String? ru;
  final String? en;
  final String? alternative;

  ArticleNames({
    required this.ru,
    required this.en,
    required this.alternative,
  });

  factory ArticleNames.fromJson(Map<String, dynamic> json) {
    return ArticleNames(
      ru: json['ru'],
      en: json['en'],
      alternative: json['alternative'],
    );
  }
}

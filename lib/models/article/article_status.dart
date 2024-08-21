class ArticleStatus {
  final String? string;
  final int? code;

  ArticleStatus({required this.string, required this.code});

  factory ArticleStatus.fromJson(Map<String, dynamic> json) {
    return ArticleStatus(
      string: json['string'],
      code: json['code'],
    );
  }
}

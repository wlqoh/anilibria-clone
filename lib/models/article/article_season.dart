class ArticleSeason {
  final String? string;
  final int? code;
  final int? year;
  final int? weekDay;

  ArticleSeason({
    required this.string,
    required this.code,
    required this.year,
    required this.weekDay,
  });

  factory ArticleSeason.fromJson(Map<String, dynamic> json) {
    return ArticleSeason(
      string: json['string'],
      code: json['code'],
      year: json['year'],
      weekDay: json['week_day'],
    );
  }
}

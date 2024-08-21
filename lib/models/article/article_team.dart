class ArticleTeam {
  final List<String> voice;
  final List translator;
  final List editing;
  final List decor;
  final List<String> timing;

  ArticleTeam({
    required this.voice,
    required this.translator,
    required this.editing,
    required this.decor,
    required this.timing,
  });

  factory ArticleTeam.fromJson(Map<String, dynamic> json) {
    final List<String> voice = [];
    final List translator = [];
    final List editing = [];
    final List decor = [];
    final List<String> timing = [];
    for (final item in json['voice']) {
      voice.add(item);
    }
    for (final item in json['translator']) {
      translator.add(item);
    }
    for (final item in json['editing']) {
      editing.add(item);
    }
    for (final item in json['decor']) {
      decor.add(item);
    }
    for (final item in json['timing']) {
      timing.add(item);
    }
    return ArticleTeam(
      voice: voice,
      translator: translator,
      editing: editing,
      decor: decor,
      timing: timing,
    );
  }
}

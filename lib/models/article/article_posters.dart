class ArticlePosters {
  final PostersSize small;
  final PostersSize medium;
  final PostersSize original;

  ArticlePosters({
    required this.small,
    required this.medium,
    required this.original,
  });

  factory ArticlePosters.fromJson(Map<String, dynamic> json) {
    return ArticlePosters(
      small: PostersSize.fromJson(json['small']),
      medium: PostersSize.fromJson(json['medium']),
      original: PostersSize.fromJson(json['original']),
    );
  }
}

class PostersSize {
  final String? url;
  final dynamic rawBase64File;

  PostersSize({
    required this.url,
    required this.rawBase64File,
  });

  factory PostersSize.fromJson(Map<String, dynamic> json) {
    return PostersSize(
      url: json['url'],
      rawBase64File: json['raw_base64_file'],
    );
  }
}

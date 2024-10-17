class Youtube {
  final int id;
  final String title;
  final Preview preview;
  final String youtubeId;
  final int? comments;
  final int? views;
  final int? timestamp;

  Youtube({
    required this.id,
    required this.title,
    required this.preview,
    required this.youtubeId,
    required this.comments,
    required this.views,
    required this.timestamp,
  });

  factory Youtube.fromJson(Map<String, dynamic> json) {
    return Youtube(
      id: json['id'],
      title: json['title'],
      preview: Preview.fromJson(json['preview']),
      youtubeId: json['youtube_id'],
      comments: json['comments'],
      views: json['views'],
      timestamp: json['timestamp'],
    );
  }
}

class Preview {
  final String src;
  final String thumbnail;

  Preview({required this.src, required this.thumbnail});

  factory Preview.fromJson(Map<String, dynamic> json) {
    return Preview(src: json['src'], thumbnail: json['thumbnail']);
  }
}

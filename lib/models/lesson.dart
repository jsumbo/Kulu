class Lesson {
  final String id;
  final String title;
  final String language;
  final double progress;
  final bool isPremium;

  Lesson({
    required this.id,
    required this.title,
    required this.language,
    required this.progress,
    this.isPremium = false,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      language: json['language'],
      progress: json['progress'].toDouble(),
      isPremium: json['isPremium'] ?? false,
    );
  }
}


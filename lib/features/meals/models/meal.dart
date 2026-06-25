class Meal {
  final String title;
  final int cookingTime;
  final String difficulty;
  final String tag;
  final String imageUrl;
  bool isFavorite;

  Meal({
    required this.title,
    required this.cookingTime,
    required this.difficulty,
    required this.tag,
    required this.imageUrl,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'cookingTime': cookingTime,
      'difficulty': difficulty,
      'tag': tag,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      title: json['title'],
      cookingTime: json['cookingTime'],
      difficulty: json['difficulty'],
      tag: json['tag'],
      imageUrl: json['imageUrl'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}

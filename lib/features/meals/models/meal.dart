class Meal {
  final String title;
  final int cookingTime;
  final String difficulty;
  final String tag;

  const Meal({
    required this.title,
    required this.cookingTime,
    required this.difficulty,
    required this.tag,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'cookingTime': cookingTime,
      'difficulty': difficulty,
      'tag': tag,
    };
  }

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      title: json['title'],
      cookingTime: json['cookingTime'],
      difficulty: json['difficulty'],
      tag: json['tag'],
    );
  }
}

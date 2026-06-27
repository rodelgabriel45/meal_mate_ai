import 'package:uuid/uuid.dart';

class Meal {
  final String id;

  final String title;
  final String description;

  final int cookingTime;
  final int servings;
  final int calories;

  final String difficulty;
  final String tag;

  final List<String> ingredients;
  final List<String> instructions;

  final String imageUrl;

  bool isFavorite;

  Meal({
    String? id,
    required this.title,
    required this.description,
    required this.cookingTime,
    required this.servings,
    required this.calories,
    required this.difficulty,
    required this.tag,
    required this.ingredients,
    required this.instructions,
    required this.imageUrl,
    this.isFavorite = false,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'cookingTime': cookingTime,
      'servings': servings,
      'calories': calories,
      'difficulty': difficulty,
      'tag': tag,
      'ingredients': ingredients,
      'instructions': instructions,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      cookingTime: json['cookingTime'],
      servings: json['servings'],
      calories: json['calories'],
      difficulty: json['difficulty'],
      tag: json['tag'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      imageUrl: json['imageUrl'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Meal copyWith({
    String? id,
    String? title,
    String? description,
    int? cookingTime,
    int? servings,
    int? calories,
    String? difficulty,
    String? tag,
    List<String>? ingredients,
    List<String>? instructions,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Meal(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      cookingTime: cookingTime ?? this.cookingTime,
      servings: servings ?? this.servings,
      calories: calories ?? this.calories,
      difficulty: difficulty ?? this.difficulty,
      tag: tag ?? this.tag,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

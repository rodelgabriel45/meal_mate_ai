import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:uuid/uuid.dart';

class MealHistory {
  final String id;

  final DateTime createdAt;

  final List<String> ingredients;

  final List<Meal> meals;

  MealHistory({
    String? id,
    DateTime? createdAt,
    required this.ingredients,
    required this.meals,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'ingredients': ingredients,
      'meals': meals.map((meal) => meal.toJson()).toList(),
    };
  }

  factory MealHistory.fromJson(Map<String, dynamic> json) {
    return MealHistory(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      ingredients: List<String>.from(json['ingredients']),
      meals: (json['meals'] as List)
          .map((meal) => Meal.fromJson(meal))
          .toList(),
    );
  }
}

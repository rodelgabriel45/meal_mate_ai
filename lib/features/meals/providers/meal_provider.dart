import 'package:flutter/material.dart';
import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:meal_mate_ai/features/meals/services/openai_service.dart';

class MealProvider extends ChangeNotifier {
  final OpenAIService _openAIService = OpenAIService();

  final List<Meal> _meals = [];
  List<Meal> get meals => List.unmodifiable(_meals);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> generateMeals(List<String> ingredients) async {
    try {
      _isLoading = true;
      _error = null;

      notifyListeners();

      final generatedMeals = await _openAIService.generateMeals(ingredients);

      _meals
        ..clear()
        ..addAll(generatedMeals);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }
}

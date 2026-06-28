import 'package:flutter/material.dart';
import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:meal_mate_ai/features/favorites/services/favorite_service.dart';
import 'package:meal_mate_ai/features/meals/services/openai_service.dart';

class MealProvider extends ChangeNotifier {
  final OpenAIService _openAIService = OpenAIService();
  final FavoriteService _favoriteService = FavoriteService();

  final List<Meal> _meals = [];
  List<Meal> get meals => List.unmodifiable(_meals);

  final List<Meal> _favorites = [];
  List<Meal> get favorites => List.unmodifiable(_favorites);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  MealProvider() {
    loadFavorites();
  }

  Future<void> generateMeals(List<String> ingredients) async {
    try {
      _isLoading = true;
      _error = null;

      notifyListeners();

      final generatedMeals = await _openAIService.generateMeals(ingredients);

      for (final meal in generatedMeals) {
        meal.isFavorite = _favorites.any(
          (favorite) => favorite.title == meal.title,
        );
      }

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

  Future<void> toggleFavorite(Meal meal) async {
    meal.isFavorite = !meal.isFavorite;

    if (meal.isFavorite) {
      final exists = _favorites.any((f) => f.id == meal.id);

      if (exists) return;

      _favorites.add(meal);
    } else {
      _favorites.removeWhere((m) => m.id == meal.id);
    }

    await _favoriteService.saveFavorites(_favorites);

    notifyListeners();
  }

  Future<void> loadFavorites() async {
    final loadedFavorites = await _favoriteService.loadFavorites();

    _favorites
      ..clear()
      ..addAll(loadedFavorites);

    notifyListeners();
  }
}

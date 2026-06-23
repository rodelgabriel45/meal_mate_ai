import 'package:flutter/material.dart';
import 'package:meal_mate_ai/features/home/models/ingredient.dart';
import 'package:meal_mate_ai/features/home/services/ingredient_service.dart';

class IngredientProvider extends ChangeNotifier {
  final IngredientService _ingredientService = IngredientService();

  final List<Ingredient> _ingredients = [];

  List<Ingredient> get ingredients => List.unmodifiable(_ingredients);

  bool get hasIngredients => _ingredients.isNotEmpty;

  IngredientProvider() {
    loadIngredients();
  }

  Future<void> addIngredient(String name) async {
    final ingredient = name.trim();

    if (ingredient.isEmpty) return;

    final exists = _ingredients.any(
      (i) => i.name.toLowerCase() == ingredient.toLowerCase(),
    );

    if (exists) return;

    _ingredients.add(Ingredient(name: ingredient));

    await _ingredientService.saveIngredients(_ingredients);

    notifyListeners();
  }

  Future<void> removeIngredient(Ingredient ingredient) async {
    _ingredients.remove(ingredient);

    await _ingredientService.saveIngredients(_ingredients);

    notifyListeners();
  }

  Future<void> loadIngredients() async {
    final loadedIngredients = await _ingredientService.loadIngredients();

    _ingredients.clear();

    _ingredients.addAll(loadedIngredients);

    notifyListeners();
  }
}

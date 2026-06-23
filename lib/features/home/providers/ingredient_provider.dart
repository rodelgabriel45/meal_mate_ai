import 'package:flutter/material.dart';
import 'package:meal_mate_ai/features/home/models/ingredient.dart';

class IngredientProvider extends ChangeNotifier {
  final List<Ingredient> _ingredients = [];

  List<Ingredient> get ingredients => List.unmodifiable(_ingredients);

  void addIngredient(String name) {
    final ingredient = name.trim();

    if (ingredient.isEmpty) return;

    final exists = _ingredients.any(
      (i) => i.name.toLowerCase() == ingredient.toLowerCase(),
    );

    if (exists) return;

    _ingredients.add(Ingredient(name: ingredient));

    notifyListeners();
  }

  void removeIngredient(Ingredient ingredient) {
    _ingredients.remove(ingredient);

    notifyListeners();
  }
}

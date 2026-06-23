import 'dart:convert';

import 'package:meal_mate_ai/features/home/models/ingredient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IngredientService {
  static const _key = 'ingredients';

  Future<void> saveIngredients(List<Ingredient> ingredients) async {
    final prefs = await SharedPreferences.getInstance();

    final ingredientsJson = ingredients.map((i) => i.toJson()).toList();

    final ingredientsString = jsonEncode(ingredientsJson);

    await prefs.setString(_key, ingredientsString);
  }

  Future<List<Ingredient>> loadIngredients() async {
    final prefs = await SharedPreferences.getInstance();

    final ingredientsString = prefs.getString(_key);

    if (ingredientsString == null) {
      return [];
    }

    final ingredientsJson = jsonDecode(ingredientsString);

    return (ingredientsJson as List)
        .map((json) => Ingredient.fromJson(json))
        .toList();
  }
}

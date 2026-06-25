import 'dart:convert';

import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const _key = 'favorites';

  Future<void> saveFavorites(List<Meal> meals) async {
    final prefs = await SharedPreferences.getInstance();

    final mealsJson = meals.map((meal) => meal.toJson()).toList();

    final mealsString = jsonEncode(mealsJson);

    await prefs.setString(_key, mealsString);
  }

  Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  Future<List<Meal>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final mealsString = prefs.getString(_key);

    if (mealsString == null) return [];

    final mealsJson = jsonDecode(mealsString);

    return (mealsJson as List).map((json) => Meal.fromJson(json)).toList();
  }
}

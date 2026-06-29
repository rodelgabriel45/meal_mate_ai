import 'package:meal_mate_ai/core/constants/app_limits.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsageLimitService {
  static const _generationCountKey = 'meal_generation_count';
  static const _generatedMealsKey = 'generated_meals_count';

  Future<int> getGenerationCount() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_generationCountKey) ?? 0;
  }

  Future<void> incrementGenerationCount() async {
    final prefs = await SharedPreferences.getInstance();

    final current = prefs.getInt(_generationCountKey) ?? 0;

    await prefs.setInt(_generationCountKey, current + 1);
  }

  Future<void> resetGenerationCount() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_generationCountKey);
  }

  Future<bool> canGenerateMeals() async {
    final count = await getGenerationCount();

    return count < AppLimits.freeMealGenerations;
  }

  Future<int> getGeneratedMealsCount() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_generatedMealsKey) ?? 0;
  }

  Future<void> incrementGeneratedMealsCount(int amount) async {
    final prefs = await SharedPreferences.getInstance();

    final current = prefs.getInt(_generatedMealsKey) ?? 0;

    await prefs.setInt(_generatedMealsKey, current + amount);
  }

  Future<void> resetGeneratedMealsCount() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_generatedMealsKey);
  }
}

import 'package:meal_mate_ai/core/constants/app_limits.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsageLimitService {
  static const _key = 'meal_generation_count';

  Future<int> getGenerationCount() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_key) ?? 0;
  }

  Future<void> incrementGenerationCount() async {
    final prefs = await SharedPreferences.getInstance();

    final current = prefs.getInt(_key) ?? 0;

    await prefs.setInt(_key, current + 1);
  }

  Future<void> resetGenerationCount() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_key);
  }

  Future<bool> canGenerateMeals() async {
    final count = await getGenerationCount();

    return count < AppLimits.freeMealGenerations;
  }
}

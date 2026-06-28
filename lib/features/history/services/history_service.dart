import 'dart:convert';

import 'package:meal_mate_ai/features/history/models/meal_history.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryService {
  static const _key = 'meal_history';

  Future<void> saveHistory(List<MealHistory> history) async {
    final prefs = await SharedPreferences.getInstance();

    final historyJson = history.map((h) => h.toJson()).toList();

    final historyString = jsonEncode(historyJson);

    await prefs.setString(_key, historyString);
  }

  Future<List<MealHistory>> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();

    final historyString = prefs.getString(_key);

    if (historyString == null) {
      return [];
    }

    final historyJson = jsonDecode(historyString);

    return (historyJson as List)
        .map((json) => MealHistory.fromJson(json))
        .toList();
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_key);
  }
}

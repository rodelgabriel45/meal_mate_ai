import 'package:flutter/material.dart';
import 'package:meal_mate_ai/features/history/models/meal_history.dart';
import 'package:meal_mate_ai/features/history/services/history_service.dart';
import 'package:meal_mate_ai/features/meals/models/meal.dart';

class MealHistoryProvider extends ChangeNotifier {
  final HistoryService _historyService = HistoryService();

  final List<MealHistory> _history = [];
  List<MealHistory> get history => List.unmodifiable(_history);

  MealHistoryProvider() {
    loadHistory();
  }

  Future<void> loadHistory() async {
    final loadedHistory = await _historyService.loadHistory();

    _history
      ..clear()
      ..addAll(loadedHistory);

    notifyListeners();
  }

  Future<void> saveSearch({
    required List<String> ingredients,
    required List<Meal> meals,
  }) async {
    final history = MealHistory(ingredients: ingredients, meals: meals);

    _history.insert(0, history);

    await _historyService.saveHistory(_history);

    notifyListeners();
  }

  Future<void> clearHistory() async {
    _history.clear();

    await _historyService.clearHistory();

    notifyListeners();
  }
}

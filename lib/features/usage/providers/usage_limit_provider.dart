import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_limits.dart';
import 'package:meal_mate_ai/features/usage/services/usage_limit_service.dart';

class UsageLimitProvider extends ChangeNotifier {
  final UsageLimitService _service = UsageLimitService();

  int _generationCount = 0;
  int get generationCount => _generationCount;

  int _generatedMealsCount = 0;
  int get generatedMeals => _generatedMealsCount;

  int get remainingGenerations =>
      AppLimits.freeMealGenerations - _generationCount;

  bool get canGenerate => _generationCount < AppLimits.freeMealGenerations;

  UsageLimitProvider() {
    loadGenerationCount();
  }

  Future<void> generatedMealsCount() async {
    //
  }

  Future<void> loadGenerationCount() async {
    _generationCount = await _service.getGenerationCount();

    _generatedMealsCount = await _service.getGeneratedMealsCount();

    notifyListeners();
  }

  Future<void> incrementGenerationCount() async {
    await _service.incrementGenerationCount();

    _generationCount++;

    notifyListeners();
  }

  Future<void> resetGenerationCount() async {
    await _service.resetGenerationCount();

    _generationCount = 0;

    notifyListeners();
  }

  Future<void> incrementGeneratedMealsCount(int amount) async {
    await _service.incrementGeneratedMealsCount(amount);

    _generatedMealsCount += amount;

    notifyListeners();
  }

  Future<void> resetGeneratedMealsCount() async {
    await _service.resetGeneratedMealsCount();

    _generatedMealsCount = 0;

    notifyListeners();
  }
}

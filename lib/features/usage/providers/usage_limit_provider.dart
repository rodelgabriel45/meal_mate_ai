import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_limits.dart';
import 'package:meal_mate_ai/features/usage/services/usage_limit_service.dart';

class UsageLimitProvider extends ChangeNotifier {
  final UsageLimitService _service = UsageLimitService();

  int _generationCount = 0;
  int get generationCount => _generationCount;

  int get remainingGenerations =>
      AppLimits.freeMealGenerations - _generationCount;

  bool get canGenerate => _generationCount < AppLimits.freeMealGenerations;

  UsageLimitProvider() {
    loadGenerationCount();
  }

  Future<void> loadGenerationCount() async {
    _generationCount = await _service.getGenerationCount();

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
}

import 'package:flutter/material.dart';
import 'package:meal_mate_ai/app.dart';
import 'package:meal_mate_ai/features/home/providers/ingredient_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => IngredientProvider(),
      child: const MealMateAI(),
    ),
  );
}

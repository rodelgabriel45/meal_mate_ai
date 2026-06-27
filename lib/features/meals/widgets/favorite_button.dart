import 'package:flutter/material.dart';
import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:meal_mate_ai/features/meals/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  final Meal meal;
  const FavoriteButton({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Consumer<MealProvider>(
      builder: (context, value, child) {
        return IconButton(
          onPressed: () {
            context.read<MealProvider>().toggleFavorite(meal);
          },
          icon: Icon(
            meal.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: meal.isFavorite ? Colors.red : Colors.black,
          ),
        );
      },
    );
  }
}

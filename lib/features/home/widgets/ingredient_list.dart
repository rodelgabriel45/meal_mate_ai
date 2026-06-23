import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/features/home/models/ingredient.dart';
import 'package:meal_mate_ai/features/home/widgets/ingredient_chip.dart';

class IngredientList extends StatelessWidget {
  final List<Ingredient> ingredients;
  final ValueChanged<Ingredient> onRemove;

  const IngredientList({
    super.key,
    required this.ingredients,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ingredients.isEmpty
        ? const Center(child: Text('No ingredients added yet.'))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your ingredients',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: AppSpacing.md),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ingredients.map((ingredient) {
                  return IngredientChip(
                    ingredient: ingredient,
                    onRemove: () => onRemove(ingredient),
                  );
                }).toList(),
              ),
            ],
          );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/home/models/ingredient.dart';

class IngredientChip extends StatelessWidget {
  final Ingredient ingredient;
  final VoidCallback onRemove;
  const IngredientChip({
    super.key,
    required this.ingredient,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white,

      side: BorderSide(color: AppColors.border),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      label: Text(ingredient.name),

      deleteIcon: const Icon(Icons.close, size: 18),

      onDeleted: onRemove,
    );
  }
}

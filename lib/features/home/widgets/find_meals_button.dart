import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/home/providers/ingredient_provider.dart';
import 'package:provider/provider.dart';

class FindMealsButton extends StatelessWidget {
  const FindMealsButton({super.key});

  void _findMeals() {
    //
  }

  @override
  Widget build(BuildContext context) {
    final hasIngredients = context.select<IngredientProvider, bool>(
      (provider) => provider.hasIngredients,
    );

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        onPressed: hasIngredients ? _findMeals : null,
        child: const Text('Find Meals ✨'),
      ),
    );
  }
}

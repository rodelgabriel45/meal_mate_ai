import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_mate_ai/core/router/app_routes.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/home/providers/ingredient_provider.dart';
import 'package:meal_mate_ai/features/meals/providers/meal_provider.dart';
import 'package:meal_mate_ai/features/usage/providers/usage_limit_provider.dart';
import 'package:provider/provider.dart';

class FindMealsButton extends StatelessWidget {
  const FindMealsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final hasIngredients = context.select<IngredientProvider, bool>(
      (provider) => provider.hasIngredients,
    );
    final isLoading = context.watch<MealProvider>().isLoading;

    Future<void> findMeals() async {
      final usageProvider = context.read<UsageLimitProvider>();

      if (!usageProvider.canGenerate) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'You have reached your free limit as a guest.\nPlease login to generate more meals.',
            ),
          ),
        );

        return;
      }

      context.push(AppRoutes.thinking);
    }

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
        onPressed: hasIngredients && !isLoading ? findMeals : null,
        child: const Text('Find Meals ✨'),
      ),
    );
  }
}

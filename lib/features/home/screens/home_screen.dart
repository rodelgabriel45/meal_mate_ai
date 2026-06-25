import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_padding.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/home/providers/ingredient_provider.dart';
import 'package:meal_mate_ai/features/home/widgets/app_header.dart';
import 'package:meal_mate_ai/features/home/widgets/find_meals_button.dart';
import 'package:meal_mate_ai/features/home/widgets/ingredient_input.dart';
import 'package:meal_mate_ai/features/home/widgets/ingredient_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppPadding.screen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(16),
                  border: BoxBorder.fromBorderSide(
                    BorderSide(color: AppColors.border),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/mealmate_logo.png',
                  width: 90,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              AppHeader(),

              SizedBox(height: AppSpacing.lg),

              IngredientInput(
                onAddIngredient: (ingredient) {
                  context.read<IngredientProvider>().addIngredient(ingredient);
                },
              ),

              SizedBox(height: AppSpacing.lg),

              Consumer<IngredientProvider>(
                builder: (context, provider, child) {
                  return IngredientList(
                    ingredients: provider.ingredients,
                    onRemove: (ingredient) {
                      context.read<IngredientProvider>().removeIngredient(
                        ingredient,
                      );
                    },
                  );
                },
              ),

              SizedBox(height: AppSpacing.lg),

              FindMealsButton(),
            ],
          ),
        ),
      ),
    );
  }
}

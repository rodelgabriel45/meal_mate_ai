import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_padding.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
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
        child: Padding(
          padding: AppPadding.screen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

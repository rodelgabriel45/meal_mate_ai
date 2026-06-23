import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_padding.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/features/home/widgets/app_header.dart';
import 'package:meal_mate_ai/features/home/widgets/ingredient_input.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void onAddIngredient(String ingredient) {
    //
  }

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

              SizedBox(height: AppSpacing.md),

              IngredientInput(onAddIngredient: onAddIngredient),

              // IngredientChip

              // IngredientList

              // FindMealsButton
            ],
          ),
        ),
      ),
    );
  }
}

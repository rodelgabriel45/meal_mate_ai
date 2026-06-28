import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_padding.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/core/widgets/back_button.dart';
import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:meal_mate_ai/features/meals/widgets/meal_card.dart';

class MealResultsScreen extends StatelessWidget {
  final List<Meal> meals;
  const MealResultsScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.screen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(),

              SizedBox(height: AppSpacing.sm),

              Text(
                'Here are meals you\ncan make!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(height: AppSpacing.sm),

              Text(
                'Based on your ingredients',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              SizedBox(height: AppSpacing.lg),

              Expanded(
                child: ListView.builder(
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    final meal = meals[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: MealCard(meal: meal),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

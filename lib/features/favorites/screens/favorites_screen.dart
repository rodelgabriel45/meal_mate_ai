import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_padding.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/favorites/widgets/favorite_meal_tile.dart';
import 'package:meal_mate_ai/features/meals/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<MealProvider>().favorites;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.screen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Favorites',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(height: AppSpacing.sm),

              Text(
                'Your saved recipes',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: AppSpacing.xl),

              favorites.isEmpty
                  ? Column(
                      children: [
                        Center(
                          child: Container(
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
                        ),

                        const SizedBox(height: AppSpacing.md),

                        const Text('No favorite meals yet.'),

                        const SizedBox(height: AppSpacing.md),

                        const Text(
                          'Tap the heart icon on any meal\nto save it here',
                        ),
                      ],
                    )
                  : Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListView.builder(
                          itemCount: favorites.length,
                          itemBuilder: (context, index) {
                            final favorite = favorites[index];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: FavoriteMealTile(meal: favorite),
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

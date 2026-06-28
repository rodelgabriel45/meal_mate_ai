import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_padding.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/features/favorites/widgets/empty_state.dart';
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
                  ? EmptyState(
                      title: 'No favorite meals yet.',
                      info: 'Tap the heart icon on any meal\nto save it here',
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

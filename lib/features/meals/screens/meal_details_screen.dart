import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_padding.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:meal_mate_ai/features/meals/providers/meal_provider.dart';
import 'package:meal_mate_ai/features/meals/widgets/hero_image.dart';
import 'package:meal_mate_ai/features/meals/widgets/info_chip.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;
  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeroImage(meal: meal),

          Expanded(
            child: Container(
              padding: AppPadding.screen,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  const SizedBox(height: AppSpacing.sm),

                  Row(
                    children: [
                      InfoChip(
                        icon: Icons.alarm,
                        text: meal.cookingTime.toString(),
                      ),

                      const SizedBox(width: AppSpacing.lg),

                      InfoChip(icon: Icons.restaurant, text: meal.difficulty),

                      const SizedBox(width: AppSpacing.lg),

                      InfoChip(icon: Icons.fitness_center, text: meal.tag),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.md),

                  Text(
                    meal.description,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),

                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: TabBar(
                              dividerColor: Colors.transparent,

                              indicator: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(14),
                              ),

                              indicatorSize: TabBarIndicatorSize.tab,

                              labelColor: AppColors.primary,

                              unselectedLabelColor: Colors.grey,

                              tabs: const [
                                Tab(text: 'Ingredients'),
                                Tab(text: 'Steps'),
                              ],
                            ),
                          ),

                          const SizedBox(height: AppSpacing.md),

                          Expanded(
                            child: TabBarView(
                              children: [
                                MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: ListView.builder(
                                    itemCount: meal.ingredients.length,
                                    itemBuilder: (context, index) {
                                      final ingredient =
                                          meal.ingredients[index];

                                      return Row(
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            size: 8,
                                            color: AppColors.primary,
                                          ),

                                          const SizedBox(width: 12),

                                          Expanded(
                                            child: Text(
                                              ingredient,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyLarge,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),

                                MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: ListView.builder(
                                    itemCount: meal.instructions.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  AppColors.primaryLight,
                                              child: Text(
                                                '${index + 1}',
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.labelSmall,
                                              ),
                                            ),

                                            SizedBox(width: 12),

                                            Expanded(
                                              child: Text(
                                                meal.instructions[index],
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<MealProvider>(
                builder: (context, provider, child) {
                  return SizedBox(
                    width: double.infinity,
                    height: 56,

                    child: ElevatedButton(
                      onPressed: () {
                        provider.toggleFavorite(meal);
                      },

                      child: Text(
                        meal.isFavorite ? "Saved" : "Save to Favorites",
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

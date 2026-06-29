import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_padding.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/history/providers/meal_history_provider.dart';
import 'package:meal_mate_ai/features/home/widgets/generation_count_card.dart';
import 'package:meal_mate_ai/features/meals/providers/meal_provider.dart';
import 'package:meal_mate_ai/features/profile/widgets/activity_card.dart';
import 'package:meal_mate_ai/features/profile/widgets/guest_header.dart';
import 'package:meal_mate_ai/features/usage/providers/usage_limit_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<MealProvider>().favorites.length;
    final history = context.watch<MealHistoryProvider>().history.length;
    final generatedMeals = context.watch<UsageLimitProvider>().generatedMeals;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screen,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    IconButton(
                      onPressed: () {
                        //
                      },
                      icon: Icon(Icons.settings),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.lg),

                GuestHeader(),

                const SizedBox(height: AppSpacing.sm),

                GenerationCountCard(),

                const SizedBox(height: AppSpacing.lg),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Activity',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                const SizedBox(height: AppSpacing.md),

                Row(
                  children: [
                    ActivityCard(
                      title: 'Favorites',
                      value: favorites.toString(),
                      icon: Icons.favorite,
                    ),

                    const SizedBox(width: AppSpacing.xs),

                    ActivityCard(
                      title: 'History',
                      value: history.toString(),
                      icon: Icons.history,
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.xs),

                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsGeometry.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Icon(
                            Icons.restaurant_menu,
                            color: AppColors.primary,
                            size: 28,
                          ),

                          const SizedBox(height: 12),

                          Text(
                            'Generated Meals',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),

                          const SizedBox(height: 12),

                          Text(
                            generatedMeals.toString(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

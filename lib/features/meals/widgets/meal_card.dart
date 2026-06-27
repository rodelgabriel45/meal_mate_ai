import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/core/router/app_routes.dart';
import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:meal_mate_ai/features/meals/widgets/favorite_button.dart';
import 'package:meal_mate_ai/features/meals/widgets/info_chip.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoutes.mealDetails, extra: meal);
      },
      child: Card(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    meal.imageUrl,

                    height: 200,
                    width: double.infinity,

                    fit: BoxFit.cover,

                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      return const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },

                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://picsum.photos/400',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),

                  Positioned(
                    top: 12,
                    right: 12,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white.withValues(alpha: 0.9),
                      child: FavoriteButton(meal: meal),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),

                    const SizedBox(height: AppSpacing.md),

                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        InfoChip(
                          icon: Icons.alarm,
                          text: '${meal.cookingTime} min',
                        ),

                        InfoChip(icon: Icons.restaurant, text: meal.difficulty),

                        InfoChip(icon: Icons.fitness_center, text: meal.tag),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/meals/models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //
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
                    'https://picsum.photos/400',

                    height: 200,
                    width: double.infinity,

                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.favorite_border, size: 20),
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
                        _InfoChip(
                          icon: Icons.alarm,
                          text: '${meal.cookingTime} min',
                        ),

                        _InfoChip(
                          icon: Icons.restaurant,
                          text: meal.difficulty,
                        ),

                        _InfoChip(icon: Icons.fitness_center, text: meal.tag),
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

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppColors.primary),

        const SizedBox(width: AppSpacing.xs),

        Text(text),
      ],
    );
  }
}

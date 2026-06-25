import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:meal_mate_ai/features/meals/providers/meal_provider.dart';
import 'package:meal_mate_ai/features/meals/widgets/info_chip.dart';
import 'package:provider/provider.dart';

class FavoriteMealTile extends StatelessWidget {
  final Meal meal;
  const FavoriteMealTile({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadiusGeometry.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                meal.imageUrl,
                width: 95,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    const SizedBox(height: AppSpacing.sm),

                    Row(
                      children: [
                        InfoChip(
                          icon: Icons.alarm,
                          text: '${meal.cookingTime} min',
                        ),

                        SizedBox(width: AppSpacing.md),

                        InfoChip(icon: Icons.restaurant, text: meal.difficulty),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Consumer<MealProvider>(
              builder: (context, provider, child) {
                return IconButton(
                  onPressed: () {
                    context.read<MealProvider>().toggleFavorite(meal);
                  },
                  icon: Icon(
                    meal.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: meal.isFavorite ? Colors.red : Colors.black,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

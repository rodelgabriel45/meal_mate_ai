import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:meal_mate_ai/features/meals/providers/meal_provider.dart';
import 'package:meal_mate_ai/features/meals/widgets/info_chip.dart';
import 'package:provider/provider.dart';

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
                      child: Consumer<MealProvider>(
                        builder: (context, value, child) {
                          return IconButton(
                            onPressed: () {
                              context.read<MealProvider>().toggleFavorite(meal);
                            },
                            icon: Icon(
                              meal.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: meal.isFavorite
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          );
                        },
                      ),
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

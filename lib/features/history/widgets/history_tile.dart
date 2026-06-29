import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/core/router/app_routes.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/core/utils/date_formatter.dart';
import 'package:meal_mate_ai/features/history/models/meal_history.dart';

class HistoryTile extends StatelessWidget {
  final MealHistory history;
  const HistoryTile({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    final ingredients = history.ingredients.take(4).join(', ');
    final hasMore = history.ingredients.length > 4;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          context.go(AppRoutes.results, extra: history.meals);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: AppColors.primary),

                const SizedBox(width: AppSpacing.md),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hasMore ? '$ingredients...' : ingredients,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: AppSpacing.xs),

                      Text(
                        'Found ${history.meals.length.toString()} recipes',
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),

                Text(DateFormatter.format(history.createdAt)),

                const SizedBox(width: AppSpacing.xs),

                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

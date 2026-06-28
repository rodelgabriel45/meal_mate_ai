import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_limits.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/usage/providers/usage_limit_provider.dart';
import 'package:provider/provider.dart';

class GenerationCountCard extends StatelessWidget {
  const GenerationCountCard({super.key});

  @override
  Widget build(BuildContext context) {
    final remainingGenerations = context
        .watch<UsageLimitProvider>()
        .remainingGenerations;

    final percentage =
        remainingGenerations / AppLimits.freeMealGenerations * 100;
    Color progressColor;

    if (remainingGenerations >= 6) {
      progressColor = AppColors.primary;
    } else if (remainingGenerations >= 3) {
      progressColor = Colors.orange;
    } else {
      progressColor = Colors.red;
    }

    return InkWell(
      onTap: () async {
        final usageProvider = context.read<UsageLimitProvider>();

        await usageProvider.resetGenerationCount();
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withValues(alpha: 0.05),
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  '✨ AI Usage',
                  style: Theme.of(context).textTheme.labelLarge,
                ),

                const SizedBox(height: AppSpacing.sm),

                const Text('Free meal generations'),

                const SizedBox(height: AppSpacing.sm),

                LinearProgressIndicator(
                  value: remainingGenerations / AppLimits.freeMealGenerations,
                  color: progressColor,
                  minHeight: 8,
                ),

                const SizedBox(height: AppSpacing.sm),

                Text(
                  '${percentage.toInt()}% remaining',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What ingredients\ndo you have?',
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        SizedBox(height: AppSpacing.sm),

        Text(
          'Add everything you have in your\nkitchen.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/profile/widgets/create_account_button.dart';

class GuestHeader extends StatelessWidget {
  const GuestHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primaryLight,
              child: Icon(Icons.person, color: AppColors.primary, size: 50),
            ),

            const SizedBox(width: AppSpacing.md),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Guest User',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                const SizedBox(height: AppSpacing.sm),

                Text(
                  'Your using MealMate AI\nwithout an account.',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.md),

        CreateAccountButton(),

        const SizedBox(height: AppSpacing.sm),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Already have an account?'),

            TextButton(
              onPressed: () {
                //
              },
              child: Text(
                'Sign In',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String info;
  const EmptyState({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(16),
              border: BoxBorder.fromBorderSide(
                BorderSide(color: AppColors.border),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Image.asset('assets/images/mealmate_logo.png', width: 90),
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        Text(title),

        const SizedBox(height: AppSpacing.md),

        Text(info),
      ],
    );
  }
}

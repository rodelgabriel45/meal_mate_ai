import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';

class FindMealsButton extends StatelessWidget {
  const FindMealsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        onPressed: () {
          //
        },
        child: const Text('Find Meals ✨'),
      ),
    );
  }
}

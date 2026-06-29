import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {
          //
        },
        child: Text(
          'Create Free Account',
          style: TextStyle(color: AppColors.surface),
        ),
      ),
    );
  }
}

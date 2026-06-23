import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/theme/app_theme.dart';
import 'package:meal_mate_ai/features/home/screens/home_screen.dart';

class MealMateAI extends StatelessWidget {
  const MealMateAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}

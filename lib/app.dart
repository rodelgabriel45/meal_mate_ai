import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/router/app_router.dart';
import 'package:meal_mate_ai/core/theme/app_theme.dart';

class MealMateAI extends StatelessWidget {
  const MealMateAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      routerConfig: AppRouter.router,
    );
  }
}

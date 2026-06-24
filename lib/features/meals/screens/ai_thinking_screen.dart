import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_padding.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/meals/providers/meal_provider.dart';
import 'package:meal_mate_ai/features/meals/screens/meal_results_screen.dart';
import 'package:provider/provider.dart';

class AIThinkingScreen extends StatefulWidget {
  final List<String> ingredients;
  const AIThinkingScreen({super.key, required this.ingredients});

  @override
  State<AIThinkingScreen> createState() => _AIThinkingScreenState();
}

class _AIThinkingScreenState extends State<AIThinkingScreen> {
  @override
  void initState() {
    super.initState();

    _generateMeals();
  }

  Future<void> _generateMeals() async {
    try {
      await context.read<MealProvider>().generateMeals(widget.ingredients);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MealResultsScreen()),
      );
    } catch (e) {
      if (!mounted) return;

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load meals.\n${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.screen,
          child: Column(
            children: [
              Align(alignment: Alignment.centerLeft, child: BackButton()),

              const SizedBox(height: 60),

              Image.asset('assets/images/chef_ai.png', width: 170),

              Text(
                'Chef AI is thinking...',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: AppSpacing.md),

              Text(
                'Finding the best meals\nyou can make!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: AppSpacing.xl),

              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(999),
                  child: const LinearProgressIndicator(
                    backgroundColor: Color(0xFFE5F3E3),
                    valueColor: AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
              ),

              const SizedBox(height: 100),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lightbulb_outline, color: Colors.amber),

                    const SizedBox(width: AppSpacing.md),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tips',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),

                          SizedBox(height: 4),

                          Text(
                            'The more ingredients you add, the better the suggestions!',
                          ),
                        ],
                      ),
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

import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/constants/app_padding.dart';
import 'package:meal_mate_ai/core/constants/app_spacing.dart';
import 'package:meal_mate_ai/features/favorites/widgets/empty_state.dart';
import 'package:meal_mate_ai/features/history/providers/meal_history_provider.dart';
import 'package:meal_mate_ai/features/history/widgets/history_tile.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = context.watch<MealHistoryProvider>().history;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.screen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'History',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(height: AppSpacing.sm),

              Text(
                'Your recent searches',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              SizedBox(height: AppSpacing.md),

              history.isEmpty
                  ? EmptyState(
                      title: 'No recent searches',
                      info: 'Your recent meal searches will\nbe saved here.',
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          final thisHistory = history[index];

                          return HistoryTile(history: thisHistory);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

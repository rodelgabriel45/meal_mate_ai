import 'package:go_router/go_router.dart';
import 'package:meal_mate_ai/features/favorites/screens/favorites_screen.dart';
import 'package:meal_mate_ai/features/history/screens/history_screen.dart';
import 'package:meal_mate_ai/features/home/screens/home_screen.dart';
import 'package:meal_mate_ai/features/meals/screens/ai_thinking_screen.dart';
import 'package:meal_mate_ai/features/meals/screens/meal_results_screen.dart';
import 'package:meal_mate_ai/features/navigation/screens/navigation_screen.dart';
import 'package:meal_mate_ai/features/profile/screens/profile_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return NavigationScreen(child: child);
        },

        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) {
              return const HomeScreen();
            },
          ),

          GoRoute(
            path: '/favorites',
            builder: (context, state) {
              return const FavoritesScreen();
            },
          ),

          GoRoute(
            path: '/history',
            builder: (context, state) {
              return const HistoryScreen();
            },
          ),

          GoRoute(
            path: '/profile',
            builder: (context, state) {
              return const ProfileScreen();
            },
          ),
        ],
      ),

      GoRoute(
        path: '/thinking',
        builder: (context, state) {
          return const AIThinkingScreen();
        },
      ),

      GoRoute(
        path: '/results',
        builder: (context, state) {
          return const MealResultsScreen();
        },
      ),
    ],
  );
}

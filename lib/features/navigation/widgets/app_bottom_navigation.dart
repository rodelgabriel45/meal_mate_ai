import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    int currentIndex = switch (location) {
      '/' => 0,
      '/favorites' => 1,
      'history' => 2,
      'profile' => 3,
      _ => 0,
    };

    return NavigationBar(
      selectedIndex: currentIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          selectedIcon: Icon(Icons.home),
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_border),
          label: 'Favorites',
          selectedIcon: Icon(Icons.favorite),
        ),
        NavigationDestination(icon: Icon(Icons.history), label: 'History'),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
          selectedIcon: Icon(Icons.person),
        ),
      ],

      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            context.go('/');
            break;

          case 1:
            context.go('/favorites');
            break;

          case 2:
            context.go('/history');
            break;

          case 3:
            context.go('/profile');
            break;
        }
      },
    );
  }
}

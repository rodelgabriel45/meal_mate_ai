import 'package:flutter/material.dart';
import 'package:meal_mate_ai/features/navigation/widgets/app_bottom_navigation.dart';

class NavigationScreen extends StatelessWidget {
  final Widget child;

  const NavigationScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,

      bottomNavigationBar: const AppBottomNavigation(),
    );
  }
}

import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const ActivityCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          child: Column(
            children: [
              Icon(icon, size: 28, color: Colors.amber),

              const SizedBox(height: 12),

              Text(title, style: Theme.of(context).textTheme.labelLarge),

              const SizedBox(height: 12),

              Text(value, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
      ),
    );
  }
}

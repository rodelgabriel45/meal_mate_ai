import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:meal_mate_ai/features/meals/widgets/favorite_button.dart';

class HeroImage extends StatelessWidget {
  final Meal meal;
  const HeroImage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .36,
      width: double.infinity,

      child: Stack(
        children: [
          Image.network(
            meal.imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Positioned(
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ),

          Positioned(
            right: 16,
            child: SafeArea(child: FavoriteButton(meal: meal)),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';
import 'package:meal_mate_ai/features/home/providers/ingredient_provider.dart';
import 'package:provider/provider.dart';

class IngredientInput extends StatefulWidget {
  const IngredientInput({super.key});

  @override
  State<IngredientInput> createState() => _IngredientInputState();
}

class _IngredientInputState extends State<IngredientInput> {
  final _controller = TextEditingController();

  void _addIngredient() {
    FocusScope.of(context).unfocus();

    final ingredient = _controller.text.trim();

    if (ingredient.isEmpty) return;

    context.read<IngredientProvider>().addIngredient(ingredient);

    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.border),
        ),
        hintText: 'Add an ingredient',
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8),
          child: Material(
            color: AppColors.primary,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: _addIngredient,
              child: const SizedBox(
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      onSubmitted: (_) => _addIngredient(),
    );
  }
}

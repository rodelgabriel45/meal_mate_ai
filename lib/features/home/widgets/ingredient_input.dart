import 'package:flutter/material.dart';
import 'package:meal_mate_ai/core/theme/app_colors.dart';

class IngredientInput extends StatefulWidget {
  final ValueChanged<String> onAddIngredient;
  const IngredientInput({super.key, required this.onAddIngredient});

  @override
  State<IngredientInput> createState() => _IngredientInputState();
}

class _IngredientInputState extends State<IngredientInput> {
  final _controller = TextEditingController();

  void _addIngredient() {
    final ingredient = _controller.text.trim();

    if (ingredient.isEmpty) return;

    widget.onAddIngredient(ingredient);

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
        suffixIcon: IconButton(
          onPressed: _addIngredient,
          icon: Padding(
            padding: EdgeInsets.all(8),
            child: Material(
              color: AppColors.primary,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: _addIngredient,
                customBorder: const CircleBorder(),
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.add, color: AppColors.surface),
                ),
              ),
            ),
          ),
        ),
      ),
      onSubmitted: (_) => _addIngredient(),
    );
  }
}

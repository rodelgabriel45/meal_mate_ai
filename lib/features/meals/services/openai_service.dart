import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:meal_mate_ai/features/meals/models/meal.dart';
import 'package:meal_mate_ai/features/meals/services/unsplash_service.dart';

class OpenAIService {
  final String _apiKey = dotenv.env['OPENAI_API_KEY'] ?? '';

  final UnsplashService _unsplashService = UnsplashService();

  Future<List<Meal>> generateMeals(List<String> ingredients) async {
    final prompt =
        '''
    Generate 3 realistic meal ideas using ONLY the provided ingredients.
    You may include common pantry staples such as salt, pepper, oil, garlic, and water.

    ${ingredients.join(', ')}

    Return ONLY a valid JSON array.
    
    Each object must have exactly these fields:

    - title
    - description
    - cookingTime
    - difficulty
    - tag
    - servings
    - calories
    - ingredients
    - instructions

    difficulty must be one of:
    Easy
    Medium
    Hard

    tag must be one of:
    High Protein
    Low Carb
    Vegetarian
    Quick Meal
    Healthy

    Example: 

    [
      {
        "title": "Meal Name",
        "description": "A quick and healthy chicken stir fry packed with vegetables.",
        "cookingTime": 20,
        "difficulty": "Easy",
        "tag": "High Protein",
        "servings": 2,
        "calories": 450,

        "ingredients": [
        "Chicken breast",
        "Broccoli",
        "Soy sauce"
        ],

        "instructions": [
        "Slice chicken.",
        "Heat Oil.",
        "Cook Chicken.",
        "Add vegetables.",
        "Serve."
        ]
      }
    ]

    Do not include markdown.
    Do not wrap the JSON in ```json.
    Do not include explanations.
    Return ONLY the JSON array.
    ''';

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/responses'),

      headers: {
        'Authorization': 'Bearer $_apiKey',

        'Content-Type': 'application/json',
      },

      body: jsonEncode({'model': 'gpt-5-mini', 'input': prompt}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to generate meals');
    }

    final responseJson = jsonDecode(response.body);

    final output = responseJson['output'] as List;

    final message = output.firstWhere((item) => item['type'] == 'message');

    final text = message['content'][0]['text'];

    final mealsJson = jsonDecode(text) as List;

    final meals = mealsJson.map((json) => Meal.fromJson(json)).toList();

    final mealsWithImages = await Future.wait(
      meals.map((meal) async {
        final imageUrl = await _unsplashService.getMealImage(meal.title);

        return meal.copyWith(imageUrl: imageUrl);
      }),
    );

    return mealsWithImages;
  }
}

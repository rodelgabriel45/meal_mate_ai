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
    Generate 2 meal ideas using these ingredients:

    ${ingredients.join(', ')}

    Return ONLY valid JSON.

    [
      {
        "title": "Meal Name",
        "cookingTime": 20,
        "difficulty": "Easy",
        "tag": "High Protein"
      }
    ]
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

        return Meal(
          title: meal.title,
          cookingTime: meal.cookingTime,
          difficulty: meal.difficulty,
          tag: meal.tag,
          imageUrl: imageUrl,
        );
      }),
    );

    return mealsWithImages;
  }
}

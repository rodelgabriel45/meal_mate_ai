import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UnsplashService {
  final String _accesssKey = dotenv.env['UNSPLASH_ACCESS_KEY'] ?? '';

  Future<String> getMealImage(String mealTitle) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.unsplash.com/search/photos'
          '?query=${Uri.encodeComponent("$mealTitle food plate")}'
          '&per_page=1',
        ),

        headers: {'Authorization': 'Client-ID $_accesssKey'},
      );

      if (response.statusCode != 200) {
        return 'https://picsum.photos/600';
      }

      final data = jsonDecode(response.body);

      final results = data['results'];

      if (results.isEmpty) {
        return 'https://picsum.photos/600';
      }

      return results[0]['urls']['regular'];
    } catch (e) {
      return 'https://picsum.photos/600';
    }
  }
}

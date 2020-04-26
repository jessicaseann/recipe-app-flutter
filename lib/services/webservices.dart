
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipeappflutter/models/recipe.dart'; 

final String API_KEY = '7ba0e5403dc5428e9cde39964adb07d1';
final String BASE = 'https://api.spoonacular.com';

class Webservices {

  Future<List<Recipe>> fetchRandomRecipes() async {

    final url = "$BASE/recipes/random?number=1&apiKey=$API_KEY";
    try {
      final response = await http.get(url);
      print(response.body);
      if(response.statusCode == 200) {
        final body = jsonDecode(response.body); 
        final Iterable json = body["recipes"];
        print(json);
        return json.map((recipe) => Recipe.fromJson(recipe)).toList();
      }
    } catch(e) {
      print(e);
      return null;
    }
  }
}
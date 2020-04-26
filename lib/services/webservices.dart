
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipeappflutter/models/recipe.dart'; 

// ignore: non_constant_identifier_names
final String API_KEY = '7ba0e5403dc5428e9cde39964adb07d1';
// ignore: non_constant_identifier_names
final String BASE = 'https://api.spoonacular.com';

class Webservices {

  Future<List<Recipe>> fetchRandomRecipes() async {

    final url = "$BASE/recipes/random?number=10&apiKey=$API_KEY";
    try {
      final response = await http.get(url);
      // print(response.body);
      if(response.statusCode == 200) {
        final body = jsonDecode(response.body); 
        final Iterable json = body["recipes"];
        // print(json);
        return json.map((recipe) => Recipe.fromJson(recipe)).toList();
      } else {
        return null;
      }
    } catch(e) {
      print(e);
      return null;
    }
  }

  Future<List<Recipe>> searchRecipe(String search) async {

    final url = "$BASE/recipes/search?query=$search&number=10&apiKey=$API_KEY";
    try {
      final response = await http.get(url);
      print(response.body);
      if(response.statusCode == 200) {
        final body = jsonDecode(response.body); 
        final Iterable json = body["results"];
        // print(json);
        return json.map((recipe) => Recipe.fromJson(recipe)).toList();
      } else {
        return null;
      }
    } catch(e) {
      print(e);
      return null;
    }
  }
}
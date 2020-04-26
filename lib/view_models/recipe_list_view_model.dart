
import 'package:flutter/material.dart';
import 'package:recipeappflutter/models/recipe.dart';
import 'package:recipeappflutter/services/webservices.dart';
import 'package:recipeappflutter/view_models/recipe_view_model.dart';

class RecipeListViewModel extends ChangeNotifier {

  List<RecipeViewModel> recipes = List<RecipeViewModel>(); 

  Future<void> fetchRandomRecipes() async {
    
    final results = await Webservices().fetchRandomRecipes();
    this.recipes = results != null ? results.map((item) => RecipeViewModel(recipe: item)).toList() : null;
    print(this.recipes);
    notifyListeners(); 
  }
}
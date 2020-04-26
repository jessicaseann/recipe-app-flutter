
import 'package:flutter/material.dart';
import 'package:recipeappflutter/models/recipe.dart';
import 'package:recipeappflutter/services/webservices.dart';
import 'package:recipeappflutter/view_models/recipe_view_model.dart';

class RecipeListViewModel extends ChangeNotifier {

  List<RecipeViewModel> recipes = List<RecipeViewModel>();
  bool loading = false; 

  Future<void> fetchRandomRecipes() async {
    this.loading = true;
    final results = await Webservices().fetchRandomRecipes();
    this.recipes = results != null ? results.map((item) => RecipeViewModel(recipe: item)).toList() : null;
    print(this.recipes);
    this.loading = false;
    notifyListeners(); 
  }

  
  Future<void> searchRecipe(String text) async {
    this.loading = true;
    notifyListeners(); 
    final results = await Webservices().searchRecipe(text);
    this.recipes = results != null ? results.map((item) => RecipeViewModel(recipe: item)).toList() : null;
    print(this.recipes);
    this.loading = false;
    notifyListeners(); 
  }

}

import 'package:recipeappflutter/models/recipe.dart';

class RecipeViewModel {

  final Recipe recipe; 

  RecipeViewModel({this.recipe});

  String get title => this.recipe.title; 
  String get image => this.recipe.image; 
  int get readyInMinutes => this.recipe.readyInMinutes; 
  int get servings => this.recipe.servings; 
  int get id => this.recipe.id; 

}
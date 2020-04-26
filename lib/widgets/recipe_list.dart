import 'package:flutter/material.dart';
import 'package:recipeappflutter/view_models/recipe_view_model.dart';

class RecipeList extends StatelessWidget {

  final List<RecipeViewModel> recipes; 

  RecipeList({this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.recipes.length,
      itemBuilder: (context, index) {
        
        final recipe = this.recipes[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: recipe.image != null ? NetworkImage('https://spoonacular.com/recipeImages/${recipe.id}-90x90.jpg') : NetworkImage('https://i.picsum.photos/id/102/250/250.jpg')
              ),
              borderRadius: BorderRadius.circular(6)
            ),
            width: 50, 
            height: 100,
            ),
          title: Text(recipe.title),
        );
      },
    );
  }
}
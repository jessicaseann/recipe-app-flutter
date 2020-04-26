import 'package:flutter/material.dart';
import 'package:recipeappflutter/view_models/recipe_view_model.dart';

class RecipeList extends StatelessWidget {
  final List<RecipeViewModel> recipes;

  RecipeList({this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8),
      itemCount: this.recipes.length,
      itemBuilder: (context, index) {
        final recipe = this.recipes[index];

        return Container(
          height: 100,
          child: Card(
              clipBehavior: Clip.antiAlias,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image(
                        fit: BoxFit.cover,
                        image: recipe.image != null
                            ? NetworkImage(
                                'https://spoonacular.com/recipeImages/${recipe.id}-90x90.jpg')
                            : NetworkImage(
                                'https://i.picsum.photos/id/102/250/250.jpg')),
                    width: 80,
                    height: 100,
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            recipe.title,
                            style: TextStyle(fontSize: 18, letterSpacing: 1.2),
                            maxLines: 1,
                          ),
                          Text("Ready in ${recipe.readyInMinutes} min(s)")
                        ],
                      ),
                    )
                  )
                ],
              )),
        );
      },
    );
  }
}

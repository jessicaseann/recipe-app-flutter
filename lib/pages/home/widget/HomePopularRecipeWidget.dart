import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeappflutter/models/recipe.dart';

class HomePopularRecipeWidget extends Widget {
  HomePopularRecipeWidget({this.recipe});

  Recipe recipe;

  @override
  Element createElement() {
    return StatelessElement(Container(
      width: 180,
      height: 200,
      child: GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Container(
                  height: 140,
                  child: Image(
                    image: NetworkImage(recipe.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        recipe.title,
                        maxLines: 1,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "${recipe.readyInMinutes} min(s)",
                        maxLines: 1,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

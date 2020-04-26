import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeappflutter/view_models/recipe_view_model.dart';

// ignore: must_be_immutable
class HomePopularRecipeWidget extends StatelessWidget {
  HomePopularRecipeWidget({this.recipes});

  List<RecipeViewModel> recipes;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(right: 32, left: 32),
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 16),
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
                            image: NetworkImage(recipes[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                recipes[index].title,
                                maxLines: 1,
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "${recipes[index].readyInMinutes} min(s)",
                                maxLines: 1,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

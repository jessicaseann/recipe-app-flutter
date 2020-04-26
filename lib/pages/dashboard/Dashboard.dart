import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeappflutter/models/recipe.dart';
import 'package:recipeappflutter/pages/dashboard/widget/HomePopularRecipeWidget.dart';
import 'package:recipeappflutter/pages/dashboard/widget/HomeRandomRecipeWidget.dart';
import 'package:recipeappflutter/view_models/recipe_list_view_model.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();

    Provider.of<RecipeListViewModel>(context, listen: false)
        .fetchRandomRecipes();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<RecipeListViewModel>(context);
    if (data.recipes != null) {
      return Container(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                      0.2,
                      0.5
                    ],
                        colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(236, 236, 236, 1)
                    ])),
              ),
              Container(
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.only(top: 32, bottom: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 32, left: 32),
                        child: Text(
                          "Discover",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Color.fromRGBO(53, 53, 53, 1)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, left: 32),
                        child: Text(
                          "Best recipe of the day",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(155, 155, 155, 1)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 32, left: 32),
                        child: HomeRandomRecipeWidget(
                          recipe: Recipe(
                              title: data.recipes[0].title,
                              readyInMinutes: data.recipes[0].readyInMinutes,
                              image: data.recipes[0].image),
                        ),
                      ),
                      Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(top: 32, right: 32, left: 32),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: Text(
                                  "Popular",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      color: Color.fromRGBO(53, 53, 53, 1)),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "View All",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      color: Color.fromRGBO(250, 120, 130, 1)),
                                ),
                              )
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 16, bottom: 4),
                        child: SizedBox(
                          height: 210,
                          child: HomePopularRecipeWidget(recipes: data.recipes.sublist(1, data.recipes.length - 1)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}

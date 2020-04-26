import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipeappflutter/models/recipe.dart';

// ignore: must_be_immutable
class HomeRandomRecipeWidget extends Widget{

  HomeRandomRecipeWidget({this.recipe});

  Recipe recipe;

  @override
  Element createElement() {
    return StatelessElement(
        Container(
          width: 300,
          height: 240,
          child: GestureDetector(
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: new NetworkImage(recipe.image),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.5, 0.7],
                              colors: [Color.fromRGBO(250, 250, 250, 0),
                                Color.fromRGBO(253, 253, 253, 0.95)]
                          )
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text(recipe.title, textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 22,
                                letterSpacing: 1.2),
                              maxLines: 1,),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4),
                              child: Text("Time: ${recipe.readyInMinutes.toString()} min(s).", textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 14),),
                              alignment: Alignment.centerLeft,
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        )
                    ),
                  ],
                )
            ),
          )
        )
    );
  }
}
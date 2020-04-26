import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipeappflutter/models/recipe.dart';
import 'package:recipeappflutter/pages/home/widget/HomePopularRecipeWidget.dart';
import 'package:recipeappflutter/pages/home/widget/HomeRandomRecipeWidget.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                margin: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 32),
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
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        "Best recipe of the day",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(155, 155, 155, 1)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      child: HomeRandomRecipeWidget(
                        recipe: Recipe(
                            title: "First Recipe",
                            readyInMinutes: 20,
                            image:
                                "https://www.foodiesfeed.com/wp-content/uploads/2019/06/top-view-for-box-of-2-burgers-home-made.jpg"),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(top: 32),
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
                      margin: EdgeInsets.only(top: 24),
                      child: HomePopularRecipeWidget(
                        recipe: Recipe(
                            title: "First Recipe",
                            readyInMinutes: 20,
                            image:
                                "https://www.foodiesfeed.com/wp-content/uploads/2019/06/top-view-for-box-of-2-burgers-home-made.jpg"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        selectedItemColor: Color.fromRGBO(250, 120, 130, 1),
        items: [
          BottomNavigationBarItem(
            title: Container(
              margin: EdgeInsets.only(top: 4, bottom: 4),
              child: Text("Recipes",
                  style:
                      GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12))),
            ),
            icon: Container(
                margin: EdgeInsets.only(top: 8),
                child: Icon(Icons.content_copy)),
          ),
          BottomNavigationBarItem(
              title: Container(
                margin: EdgeInsets.only(top: 4, bottom: 4),
                child: Text("Search",
                    style:
                        GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12))),
              ),
              icon: Container(
                margin: EdgeInsets.only(top: 8),
                child: Icon(Icons.search),
              )),
          BottomNavigationBarItem(
            title: Container(
              margin: EdgeInsets.only(top: 4, bottom: 4),
              child: Text("Saved",
                  style:
                      GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12))),
            ),
            icon: Container(
                margin: EdgeInsets.only(top: 8),
                child: Icon(Icons.bookmark_border)),
          )
        ],
      ),
    );
  }
}

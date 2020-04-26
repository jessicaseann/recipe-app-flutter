import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipeappflutter/pages/dashboard/Dashboard.dart';
import 'package:recipeappflutter/view_models/recipe_list_view_model.dart';
import 'package:recipeappflutter/pages/search/search_page.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int index = 0;
  Widget getBody(int index) {
    switch (index) {
      case 0:
        return ChangeNotifierProvider(
          create: (context) => RecipeListViewModel(),
          child: Dashboard(),
        );
      case 1:
        return ChangeNotifierProvider(
          create: (context) => RecipeListViewModel(),
          child: SearchPage(),
        );
    }
    return Center(child: Text("There is no page builder for this index."),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        onTap: (value) => setState(() => index = value),
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

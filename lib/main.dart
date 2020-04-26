import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeappflutter/pages/recipe/recipe_list_page.dart';
import 'package:recipeappflutter/view_models/recipe_list_view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home : ChangeNotifierProvider(
        create: (context) => RecipeListViewModel(), 
        child: RecipeListPage(),
      )
      
      // RecipeListPage()
    );
  }
}

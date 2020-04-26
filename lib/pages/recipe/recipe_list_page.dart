
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeappflutter/view_models/recipe_list_view_model.dart';
import 'package:recipeappflutter/widgets/loading.dart';
import 'package:recipeappflutter/widgets/recipe_list.dart';

class RecipeListPage extends StatefulWidget {
  @override 
  _RecipeListPageState createState() => _RecipeListPageState(); 
}

class _RecipeListPageState extends State<RecipeListPage> {

  final TextEditingController _controller = TextEditingController(); 

  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
    Provider.of<RecipeListViewModel>(context, listen: false).fetchRandomRecipes();
  }

  @override
  Widget build(BuildContext context) {

    final data = Provider.of<RecipeListViewModel>(context);
    if (!data.loading && data.recipes != null) {
      return  Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: RefreshIndicator(
          onRefresh: () => data.fetchRandomRecipes(),
          child: RecipeList(recipes: data.recipes)
        )
      );
    } else if (data.loading) {
      return Loading();
    } else {
      return Text('Something Wrong');
    }
  }
}
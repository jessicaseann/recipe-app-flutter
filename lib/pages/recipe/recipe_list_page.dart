
import 'package:flutter/material.dart';
import 'package:recipeappflutter/services/webservices.dart';
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
    //Provider.of<RecipeListViewModel>(context, listen: false).fetchRecipes("batman");
  }

  @override
  Widget build(BuildContext context) {

    // final vm = Provider.of<RecipeListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes")
      ),
      body: FutureBuilder(
          future: Webservices().fetchRandomRecipes(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                return Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: RefreshIndicator(
                    onRefresh: () => Webservices().fetchRandomRecipes(),
                    child: RecipeList(recipes: snapshot.data)
                  )
                );
              } else {
                return Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('No Data Found'),
                        RaisedButton(
                          onPressed: () => Webservices().fetchRandomRecipes(),
                          child: Text("Refresh"))
                      ],
                    )
                  )
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            } else {
              return null;
            }
          })
      );  
  }
}
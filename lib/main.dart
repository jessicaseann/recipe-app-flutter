import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipeappflutter/pages/home/Home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.dmSerifTextTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Home(title: 'Flutter Demo Home Page'),
    );
  }
}

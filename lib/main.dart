import 'package:flutter/material.dart';
import 'package:flutter_movie/pages/home.dart';
import 'package:flutter_movie/pages/introduction.dart';
void main() => runApp(new Movie());
class Movie extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData( 
        primarySwatch: Colors.teal
      ),
      home: Introduction(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => Home()
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:category_app/feature/CategoryListScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Flutter App',

      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: new CategoryListScreen(),

    );
  }
}


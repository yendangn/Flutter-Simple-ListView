import 'package:category_app/schema/Category.dart';
import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatefulWidget {

  Category category;

  CategoryDetailScreen({Key key, this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      new CategoryDetailState(category: category);
}

class CategoryDetailState extends State<CategoryDetailScreen> {
  Category category;

  CategoryDetailState({this.category});


  @override
  Widget build(BuildContext context) {
   
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          category.name.toUpperCase(),
          style: new TextStyle(color: Colors.white, fontFamily: "Arquitecta"),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),

    );
    
  }
}

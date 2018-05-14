import 'package:flutter/material.dart';
import 'package:category_app/feature/CategoryDetailScreen.dart';
import 'package:category_app/schema/Category.dart';

class CategoryListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new CategoryListState();
}

class CategoryListState extends State<CategoryListScreen> {

  List<Category> categories = new List();

  @override
  void initState() {
    createDummyData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        title: new Text(
          "Categories".toUpperCase(),
          style: new TextStyle(color: Colors.white, fontFamily: "Arquitecta"),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: new Center(
        child: new Container(
          child: new ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => new CategoryCard(
                  category: categories[index],
                  callback: (category) {

                    _gotoCategoryDetailPage(category);

                  },
                ),
            itemCount: categories.length,
            padding: new EdgeInsets.all(20.0),
          ),
        ),
      ),
    );
  }

  void _gotoCategoryDetailPage(Category category){

    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new CategoryDetailScreen(
            category: category,
          )),
    );

  }

  createDummyData() {
    setState(() {
      categories.clear();

      categories.add(new Category(
          id: 7, name: "Travel", image: "assets/travel.jpg", postCount: 53));

      categories.add(new Category(
          id: 1, name: "Sport", image: "assets/sport.jpg", postCount: 123));

      categories.add(new Category(
          id: 2, name: "Art", image: "assets/art.jpg", postCount: 12));

      categories.add(new Category(
          id: 3,
          name: "Business",
          image: "assets/business.jpg",
          postCount: 98));

      categories.add(new Category(
          id: 4, name: "Cooking", image: "assets/cooking.jpg", postCount: 122));

      categories.add(new Category(
          id: 5, name: "Movie", image: "assets/movie.jpg", postCount: 321));

      categories.add(new Category(
          id: 6, name: "Music", image: "assets/music.jpg", postCount: 31));
    });
  }
}

typedef void CategoryClick(Category category);

class CategoryCard extends StatelessWidget {
  Category category;
  CategoryClick callback;

  CategoryCard({this.category, this.callback});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        callback(category);
      },
      child: new Card(
        color: Colors.white,
        margin: new EdgeInsets.all(10.0),
        child: new Container(
          height: 100.0,
          width: double.infinity,
          child: new Stack(
            children: <Widget>[
              new Image.asset(
                category.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              new Container(
                color: new Color(0x80000000),
              ),
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      category.name,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontFamily: "OpenSanBold"),
                    ),
                    new Text(
                      "${category.postCount} posts",
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: "OpenSanRegular"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

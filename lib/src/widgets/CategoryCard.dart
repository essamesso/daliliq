import 'package:dalilaq/src/screens/sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:dalilaq/src/screens/all_category_screen.dart';

class CategoryCard extends StatefulWidget {
  final int index;
  CategoryCard({this.index});
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return widget.index < 7
        ? InkWell(
            child: Container(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/imgs/Beauty.png"),
                  ),
                  Text("Beauty", style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubCategoriesScreen()));
            },
          )
        : widget.index < 8
            ? InkWell(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/imgs/more_category.PNG"),
                        ),
                      ),
                      Text("More",
                          style: Theme.of(context).textTheme.headline5),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllCategoryScreen()));
                },
              )
            : Container();
  }
}

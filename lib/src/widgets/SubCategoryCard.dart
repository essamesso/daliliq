import 'package:flutter/material.dart';
import 'package:dalilaq/src/screens/sub_categories_details_screen.dart';

class SubCategoryCard extends StatefulWidget {
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<SubCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              image: DecorationImage(
                  image: AssetImage("assets/imgs/تنزيل-_-1@3x.png"),
                  fit: BoxFit.cover)),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubCategoriesDetailsScreen()));
      },
    );
  }
}

import 'package:dalilaq/src/widgets/FavoretWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dalilaq/src/screens/sub_categories_details_screen.dart';

class ProductCard extends StatefulWidget {
  final int poision;
  ProductCard({this.poision});
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        child: Container(
          height: 125,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage("assets/imgs/تنزيل-_2_@3x.png"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    width: 8,
                  ),
                  RatingBar(
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
              Container(
                width: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Smiley’s Store",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "114km",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            FavoretW()
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/imgs/Layer_x-8@3x.png",
                          width: 20,
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Text(
                            "_opens_soon".tr(),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Text(
                          "09:00",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Image.asset(
                            "assets/imgs/Layer_x-9@3x.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SubCategoriesDetailsScreen()));
        },
      ),
    );
  }
}

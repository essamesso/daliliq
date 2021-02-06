import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/src/provider/favoret_provider.dart';
import 'package:dalilaq/src/widgets/CommintsCard.dart';
import 'package:dalilaq/src/widgets/FavoretWidget.dart';
import 'package:dalilaq/src/widgets/NewProductCard.dart';
import 'package:dalilaq/src/widgets/ShareW.dart';
import 'package:dalilaq/src/widgets/SharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:dalilaq/src/screens/all_products_screen.dart';
import 'package:provider/provider.dart';

class SubCategoriesDetailsScreen extends StatefulWidget {
  createState() => SubCategoriesDetailsView();
}

class SubCategoriesDetailsView extends StateMVC<SubCategoriesDetailsScreen> {
  SubCategoriesDetailsView() : super(UserController()) {
    _userController = UserController.con;
  }
  UserController _userController;
  bool isLoading = false;
  File imageProfile;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final favoretProvider = Provider.of<FavoretProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 0, top: 25),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CarouselSlider(
                      items: imgList.map((image) {
                        return Builder(builder: (context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                image: DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover)),
                          );
                        });
                      }).toList(),
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: false,
                        viewportFraction: 1.0,
                        initialPage: 2,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },

                        // aspectRatio: 16.9/9.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/imgs/تنزيل-_2_@3x.png"))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: RatingBar(
                              initialRating: 5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ShareW(
                title: "Dalilaq App",
                image: "assets/imgs/Banner 1@3x.png",
              ),
              FavoretW()
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Capital of Roman Empire",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  "Rome's history spans more than 2,500 years. While Roman mythology dates the founding of Rome at around 753 BC, the site has been inhabited for much longer, making it one of the oldest continuously occupied sites in Europe.",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      info("opens", "assets/imgs/Layer_x-8@3x.png"),
                      info("CALL ME", "assets/imgs/phone@3x.png"),
                      info("Delivery", "assets/imgs/Layer_x-9@3x.png"),
                      info("114Km",
                          "assets/imgs/get-directions-button-5@3x.png"),
                      info("CHAT", "assets/imgs/chat_active.png"),
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/imgs/Map.png"))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "NEW PRODUCT",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    InkWell(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "SEE ALL",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllProductsScreen()));
                      },
                    ),
                  ],
                ),
                Container(
                  height: 16,
                ),
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return NewProductCard();
                    },
                  ),
                ),
                Container(
                  height: 16,
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return CommintsCard();
                  },
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget info(String name, String image) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }
}

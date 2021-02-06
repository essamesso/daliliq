import 'package:carousel_slider/carousel_slider.dart';
import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/src/screens/sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dalilaq/src/widgets/CategoryCard.dart';
import 'package:dalilaq/src/widgets/SubCategoryCard.dart';

class HomeScreen extends StatefulWidget {
  createState() => HomeView();
}

class HomeView extends StateMVC<HomeScreen> {
  HomeView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 1.2,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Stack(children: <Widget>[
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
                                        fit: BoxFit.cover),
                                  ),
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
                      ]),
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white),
                    )
                  ],
                ),
                Positioned(
                  top: 180,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: <Widget>[
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: GestureDetector(
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 8,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/imgs/search.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    width: 8,
                                  ),
                                  Text(
                                    "_search".tr(),
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,

                  // childAspectRatio: 0.6,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              physics: ClampingScrollPhysics(),
              itemCount: 8,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CategoryCard(
                  index: index,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "_electronics".tr(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    InkWell(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "_see_all".tr(),
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubCategoriesScreen()));
                      },
                    )
                  ],
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,

                  // childAspectRatio: 0.6,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              physics: ClampingScrollPhysics(),
              itemCount: 9,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SubCategoryCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}

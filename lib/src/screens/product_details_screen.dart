import 'package:carousel_slider/carousel_slider.dart';
import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/src/provider/counter_provider.dart';
import 'package:dalilaq/src/provider/select_color_provider.dart';
import 'package:dalilaq/src/widgets/AllCategoryCard.dart';
import 'package:dalilaq/src/widgets/ButtonW.dart';
import 'package:dalilaq/src/widgets/FavoretWidget.dart';
import 'package:dalilaq/src/widgets/ShareW.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dalilaq/src/screens/checkou_screen.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  createState() => ProductDetailsView();
}

class ProductDetailsView extends StateMVC<ProductDetailsScreen> {
  ProductDetailsView() : super(UserController()) {
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

  final List<int> colorList = [
    0xffED5199,
    0xffFF8C69,
    0xff67B5F7,
    0xff6F5151,
    0xffC9C9C9,
    0xff3E3A3A,
  ];
  bool isSelected = false;
  void selectedColor(int index) {
    if (index == 2) {
      setState(() {
        isSelected = true;
      });
    } else {
      setState(() {
        isSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    final colorProvider = Provider.of<ColorSelectProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {
                        counterProvider.removeCounter();
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
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
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[FavoretW(), ShareW()],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color(0xff8C8C8C),
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.map((url) {
                            int index = imgList.indexOf(url);
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? Color.fromRGBO(0, 0, 0, 0.9)
                                    : Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          r"$ 130",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          "ULTRABOOST 20 SHOES NMD_R1 ",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Row(
                        children: <Widget>[
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
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "_SEE_REVIEW".tr(),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/imgs/Group 30@3x.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                    onTap: () {
                                      counterProvider.deCrement();
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      counterProvider.counter.toString(),
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                  ),
                                  InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/imgs/Group 29@3x.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                    onTap: () {
                                      counterProvider.inCrement();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            ButtonW(
                              buttonName: "_send_a_Order".tr(),
                              buttonImage: "assets/imgs/icon@3x.png",
                              height: 45,
                              width: MediaQuery.of(context).size.width / 2.2,
                              sochialOrNormal: 0,
                              sendOrNot: 1,
                              function: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Checkout()));
                              },
                            )
                          ],
                        ),
                      ),
                      Text(
                        "SELECT COLOR",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: colorList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Color(colorList[index]),
                                      child: index == colorProvider.position
                                          ? Image.asset(
                                              "assets/imgs/selected@3x.png")
                                          : Container(),
                                    ),
                                  ),
                                  onTap: () {
                                    colorProvider.isSelectedMethod(index);
                                  },
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "BRAND",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  "Lily’s Ankle Boots",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "SKU",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  "0590458902809",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 25, bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "CONDITION",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  "Brand New, With Box",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "MATERIAL",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  "Faux Sued, Velvet",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "CATEGORY",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  "Women Shoes",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "FITTING",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  "True To Size",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

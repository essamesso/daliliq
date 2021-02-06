import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/src/provider/cart_provider.dart';

import 'package:dalilaq/src/widgets/AllProductsCard.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dalilaq/src/screens/checkou_screen.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatefulWidget {
  createState() => AllProductsView();
}

class AllProductsView extends StateMVC<AllProductsScreen> {
  AllProductsView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).backgroundColor,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    r"$130",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 12,
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Checkout()));
            }),
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
                height: 80,
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
                          Navigator.pop(context);
                        }),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: GestureDetector(
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 1.2,
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
                                style: Theme.of(context).textTheme.headline4,
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
              Row(
                children: <Widget>[
                  Text(
                    "_filter".tr(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ButtonTheme(
                              minWidth: 50.0,
                              child: RaisedButton(
                                  color: Color(0xffFFFFFF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(
                                    "_sort".tr(),
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  onPressed: () {}),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ButtonTheme(
                              minWidth: 50.0,
                              child: RaisedButton(
                                  color: Color(0xffFFFFFF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(
                                    "_price".tr(),
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  onPressed: () {}),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ButtonTheme(
                              minWidth: 50.0,
                              child: RaisedButton(
                                  color: Color(0xffFFFFFF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(
                                    "_letters".tr(),
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: cartProvider.productList.length,
                itemBuilder: (context, index) {
                  return AllProductCard(
                    index: index,
                    data: cartProvider.productList[index],
                  );
                },
              )
            ],
          ),
        ));
  }
}

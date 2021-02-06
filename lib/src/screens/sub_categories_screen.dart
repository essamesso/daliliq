import 'package:dalilaq/ConstantVarables.dart';
import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/src/widgets/ProductCard.dart';
import 'package:dalilaq/src/widgets/TextFormFieldW.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

class SubCategoriesScreen extends StatefulWidget {
  createState() => SubCategoriesView();
}

class SubCategoriesView extends StateMVC<SubCategoriesScreen> {
  SubCategoriesView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;

  @override
  Widget build(BuildContext context) {
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
            height: 90,
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
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextFormFieldW(
                              textInputType: TextInputType.text,
                              image: "assets/imgs/search.png",
                              hintText: "_search".tr(),
                              obSecureText: false,
                              controller: ConstantVarable.searchController,
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 1,
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 4,
                                ),
                                Image.asset("assets/imgs/search.png"),
                                Container(
                                  width: 4,
                                ),
                                Text(
                                  "City",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Container(
                                  width: 4,
                                ),
                                Image.asset(
                                  "assets/imgs/pin@3x.png",
                                  width: 20,
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "_filter".tr(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
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
                                    "_open".tr(),
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  onPressed: () {}),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: RaisedButton(
                                color: Color(0xffFFFFFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "_Delivery".tr(),
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                onPressed: () {}),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: RaisedButton(
                                padding: EdgeInsets.all(0),
                                color: Color(0xffFFFFFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "_price".tr(),
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      poision: index,
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/src/widgets/AllCategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

class AllCategoryScreen extends StatefulWidget {
  createState() => AllCategoryView();
}

class AllCategoryView extends StateMVC<AllCategoryScreen> {
  AllCategoryView() : super(UserController()) {
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
                                      image:
                                          AssetImage("assets/imgs/search.png"),
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
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,

                  // childAspectRatio: 0.6,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              physics: ClampingScrollPhysics(),
              itemCount: 30,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AllCategoryCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}

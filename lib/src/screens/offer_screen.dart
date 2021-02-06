import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/src/widgets/CategoryCard.dart';
import 'package:dalilaq/src/widgets/OfferCard.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

class OfferScreen extends StatefulWidget {
  createState() => OfferView();
}

class OfferView extends StateMVC<OfferScreen> {
  OfferView() : super(UserController()) {
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
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CategoryCard(
                      index: index,
                    ),
                  );
                },
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              physics: ClampingScrollPhysics(),
              itemCount: 10,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return OfferCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}

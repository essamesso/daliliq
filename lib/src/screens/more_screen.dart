import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/src/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:dalilaq/src/widgets/MoreItemW.dart';
import 'package:dalilaq/src/screens/privace_screen.dart';
import 'package:dalilaq/src/screens/terms_screen.dart';
import 'package:dalilaq/src/screens/checkou_screen.dart';
import 'package:dalilaq/src/screens/messages_screen.dart';
import 'package:dalilaq/src/screens/add_a_page_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class MoreScreen extends StatefulWidget {
  createState() => MoreView();
}

class MoreView extends StateMVC<MoreScreen> {
  MoreView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imgs/background.PNG"),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/imgs/photo.png"),
                        ),
                        Container(
                          width: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Jane Doe",
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Text(
                                "janedoe123@email.com",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              OutlineButton(
                                  child: Text(
                                    "EDIT PROFILE",
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  borderSide: BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  onPressed: () {})
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              MoreItemW(
                                image: "assets/imgs/logout.png",
                                title: "Log out",
                                function: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                      (Route<dynamic> route) => false);
                                },
                                last: false,
                              ),
                              MoreItemW(
                                image: "assets/imgs/heart-10@3x.png",
                                title: "Favorite",
                                function: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Checkout()));
                                },
                                last: false,
                              ),
                              MoreItemW(
                                image: "assets/imgs/Messages.png",
                                title: "Messages",
                                function: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MessagesScreen(
                                                title: "_message".tr(),
                                              )));
                                },
                                last: false,
                              ),
                              MoreItemW(
                                image: "assets/imgs/Requests.png",
                                title: "Requests",
                                function: () {},
                                last: false,
                              ),
                              MoreItemW(
                                image: "assets/imgs/Notification.png",
                                title: "Notification Settings",
                                function: () {},
                                last: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 32),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              MoreItemW(
                                image: "assets/imgs/add.png",
                                title: "Add a page",
                                function: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddAPageScreen()));
                                },
                                last: false,
                              ),
                              MoreItemW(
                                image: "assets/imgs/Privacy.png",
                                title: "Privacy Policy",
                                function: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PrivacyScreen()));
                                },
                                last: false,
                              ),
                              MoreItemW(
                                image: "assets/imgs/Terms.png",
                                title: "Terms of service",
                                function: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TermsScreen()));
                                },
                                last: false,
                              ),
                              MoreItemW(
                                image: "assets/imgs/languages-1@3x.png",
                                title: "language",
                                function: () {},
                                last: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

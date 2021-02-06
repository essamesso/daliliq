import 'dart:async';

import 'package:dalilaq/ConstantVarables.dart';
import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/src/controllers/UserLocalStorage.dart';
import 'package:dalilaq/src/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      UserLocalStorage().getUser().then((user) {
        UserController().locationData().then((latLong) {
          if (latLong != null) {
            ConstantVarable.lat = latLong[0];
            ConstantVarable.long = latLong[1];
            if (user.email != null) {
              ConstantVarable.userName = user.name;
              ConstantVarable.userId = user.id;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            } else {
              ConstantVarable.userName = "_user_name".tr();
              ConstantVarable.userId = user.id;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            }
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/imgs/background.PNG"),
              fit: BoxFit.cover)),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 4,
          child: Image.asset("assets/imgs/logo.png"),
        ),
      ),
    ));
  }
}

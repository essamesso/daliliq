import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LocalScreen extends StatefulWidget {
  createState() => LocalView();
}

class LocalView extends StateMVC<LocalScreen> {
  LocalView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

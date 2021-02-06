import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:dalilaq/src/widgets/MessageCard.dart';

class MessagesScreen extends StatefulWidget {
  final String title;
  MessagesScreen({this.title});
  createState() => MessagesView();
}

class MessagesView extends StateMVC<MessagesScreen> {
  MessagesView() : super(UserController()) {
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
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
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
                return MessageCard(
                  poision: index,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:dalilaq/ConstantVarables.dart';
import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/src/widgets/TextFormFieldW.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

class ChatScreen extends StatefulWidget {
  createState() => ChatView();
}

class ChatView extends StateMVC<ChatScreen> {
  ChatView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color(0xffF5F6F8)),
          child: Column(
            children: <Widget>[
              Container(
                height: 25,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 16),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Smiley’s Store",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  "Active",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: Text(
                                "SS",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 90,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            "assets/imgs/phoca_thumb_l_sama_290x240@3x.png"),
                        radius: 35,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Order: #1084028",
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  Text(
                                    "Red Cotton Scarf, 2ft, Dark Red",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    r"$11.00",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                              Image.asset("assets/imgs/icon@3x.png")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                "Tuesday, 9:20 AM",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                              bottomRight: Radius.circular(22),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Dear customer, your order has been shipped.Please see below for the tracking number.Your parcel should arrive between 10 - 20 days.If you have any questions, please contact us and we will get back to you at our earliest. Thank you for choosing our shop! 😊 ",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/imgs/add@3x.png"),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormFieldW(
                            controller: ConstantVarable.messageController,
                            hintText: "Type your message...",
                            obSecureText: false,
                            searchOrKnow: false,
                            textInputType: TextInputType.text,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/imgs/send@3x.png"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

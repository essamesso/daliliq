import 'package:flutter/material.dart';
import 'package:dalilaq/src/screens/chat_screen.dart';

class MessageCard extends StatefulWidget {
  final int poision;
  MessageCard({this.poision});
  @override
  _MessageCardState createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("assets/imgs/photo.png"),
              ),
              Container(
                width: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Smiley’s Store",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "9:20 AM",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Container(
                      height: 16,
                    ),
                    widget.poision == 0
                        ? CircleAvatar(
                            radius: 15,
                            backgroundColor: Theme.of(context).backgroundColor,
                            child: Text(
                              "5",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          )
                        : Container()
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
      ),
    );
  }
}

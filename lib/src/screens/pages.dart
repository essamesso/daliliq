import 'dart:io';

import 'package:dalilaq/ConstantVarables.dart';
import 'package:flutter/material.dart';
import 'package:dalilaq/src/screens/home_screen.dart';
import 'package:dalilaq/src/screens/offer_screen.dart';
import 'package:dalilaq/src/screens/messages_screen.dart';
import 'package:dalilaq/src/screens/more_screen.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class PagesTestWidget extends StatefulWidget {
  int currentTab;
  Widget currentPage = HomeScreen();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  PagesTestWidget({this.currentTab}) {
    currentTab = currentTab != null ? currentTab : 0;
  }

  @override
  _PagesTestWidgetState createState() {
    return _PagesTestWidgetState();
  }
}

class _PagesTestWidgetState extends State<PagesTestWidget> {
  static final kInitialPosition =
      LatLng(ConstantVarable.lat, ConstantVarable.long);
  PickResult selectedPlace;
  initState() {
    super.initState();
    _selectTab(widget.currentTab);
  }

  @override
  void didUpdateWidget(PagesTestWidget oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentPage = HomeScreen();
          break;
        case 1:
          widget.currentPage = PlacePicker(
            apiKey: ConstantVarable.apiMap,
            initialPosition: kInitialPosition,
            useCurrentLocation: true,
            //usePlaceDetailSearch: true,
            onPlacePicked: (result) {
              selectedPlace = result;
              Navigator.of(context).pop();
              setState(() {});
            },
          );

          break;
        case 2:
          widget.currentPage = OfferScreen();
          break;
        case 3:
          widget.currentPage = MessagesScreen(
            title: "_message".tr(),
          );
          break;
        case 4:
          widget.currentPage = MoreScreen();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to exit an App'),
                actions: <Widget>[
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Material(
                        color: Theme.of(context).backgroundColor,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                            child: Text(
                              EasyLocalization.of(context).locale ==
                                      Locale('en')
                                  ? "cancel"
                                  : "الغاء",
                              style: TextStyle(
                                  color: Colors.grey[50],
                                  fontSize:
                                      MediaQuery.of(context).size.width / 23),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Material(
                        color: Theme.of(context).backgroundColor,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                            child: Text(
                              EasyLocalization.of(context).locale ==
                                      Locale('en')
                                  ? "ok"
                                  : "حسنا",
                              style: TextStyle(
                                  color: Colors.grey[50],
                                  fontSize:
                                      MediaQuery.of(context).size.width / 23),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      exit(0);
                    },
                  )
                ],
              ),
            ) ??
            false;
      },
      child: Scaffold(
        key: widget.scaffoldKey,
        body: widget.currentPage,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).accentColor,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 40,
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          selectedIconTheme: IconThemeData(size: 28),
          unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
          currentIndex: widget.currentTab,
          onTap: (int i) {
            this._selectTab(i);
          },
          // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
                title: Container(),
                icon: Column(
                  children: <Widget>[
                    Container(
                        width: 24.0,
                        height: 24.0,
                        child: Image.asset(widget.currentTab == 0
                            ? "assets/imgs/home_active.png"
                            : "assets/imgs/home.png")),
                    Container(height: 4.0),
                    Text("_home".tr(),
                        style: Theme.of(context).textTheme.headline6)
                  ],
                )),
            BottomNavigationBarItem(
                title: Container(),
                icon: Column(
                  children: <Widget>[
                    Container(
                        width: 24.0,
                        height: 24.0,
                        child: Image.asset(widget.currentTab == 1
                            ? "assets/imgs/local_active.png"
                            : "assets/imgs/local.png")),
                    Container(height: 4.0),
                    Text("_local".tr(),
                        style: Theme.of(context).textTheme.headline6)
                  ],
                )),
            BottomNavigationBarItem(
                title: Container(),
                icon: Column(
                  children: <Widget>[
                    Container(
                        width: 24.0,
                        height: 24.0,
                        child: Image.asset(widget.currentTab == 2
                            ? "assets/imgs/cart_active.png"
                            : "assets/imgs/cart.png")),
                    Container(height: 4.0),
                    Text("_offer".tr(),
                        style: Theme.of(context).textTheme.headline6)
                  ],
                )),
            BottomNavigationBarItem(
              title: Container(),
              icon: Column(
                children: <Widget>[
                  Container(
                      width: 24.0,
                      height: 24.0,
                      child: Image.asset(widget.currentTab == 3
                          ? "assets/imgs/chat_active.png"
                          : "assets/imgs/chat.png")),
                  Container(height: 4.0),
                  Text("_chat".tr(),
                      style: Theme.of(context).textTheme.headline6)
                ],
              ),
            ),
            BottomNavigationBarItem(
              title: Container(),
              icon: InkWell(
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 24.0,
                        height: 24.0,
                        child: Image.asset(widget.currentTab == 4
                            ? "assets/imgs/more_active.png"
                            : "assets/imgs/more.png")),
                    Container(height: 4.0),
                    Text("_more".tr(),
                        style: Theme.of(context).textTheme.headline6)
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MoreScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

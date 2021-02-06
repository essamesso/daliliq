import 'dart:io';

import 'package:dalilaq/src/controllers/AddAPageController.dart';
import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/ConstantVarables.dart';
import 'package:dalilaq/src/data/models/CategoriesModel.dart';
import 'package:dalilaq/src/data/models/CityMenu.dart';
import 'package:dalilaq/src/data/models/DayModel.dart';
import 'package:dalilaq/src/data/models/TimeMintModel.dart';
import 'package:dalilaq/src/data/models/TmieHoursModel.dart';
import 'package:dalilaq/src/widgets/ButtonW.dart';
import 'package:dalilaq/src/widgets/SharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:dalilaq/src/widgets/TextFormFieldW.dart';

class AddAPageScreen extends StatefulWidget {
  createState() => AddAPageView();
}

class AddAPageView extends StateMVC<AddAPageScreen> {
  AddAPageView() : super(AddAPageController()) {
    _addAPageController = AddAPageController.con;
  }
  AddAPageController _addAPageController;
  bool isLoading = false;
  File imageProfile;
  String dropDownTitleCategory = "_chose_category".tr();
  String dropDownTitleCityMenu = "_chose_city".tr();
  String dropDownTitleDay = "_chose_day".tr();
  String dropDownTitleTimeHours = "_chose_time_hours".tr();
  String dropDownTitleTimeMint = "_chose_time_mint".tr();

  CategoriesModel selectedCategories;
  CityMenu selectedCityMenu;
  DayModel selectedDay;
  TimeHoursModel selectedTimeHours;
  TimeMintModel selectedTimeMint;
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xffF5F6F8)),
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xffE03D3D),
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Add a page",
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Company name",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Form(
                    key: ConstantVarable.addPageFormKey,
                    autovalidate: ConstantVarable.addPageAutoValid,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: TextFormFieldW(
                              textInputType: TextInputType.text,
                              controller: ConstantVarable.pageNameController,
                              validator: (val) =>
                                  UserController().validateUserName(val),
                              hintText: "Enter the page name",
                              obSecureText: false,
                              searchOrKnow: false,
                            ),
                          ),
                        ),
                        Container(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: <Widget>[
                              DropdownButton<CategoriesModel>(
                                  hint: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      dropDownTitleCategory,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                  underline: Container(),
                                  value: selectedCategories,
                                  iconSize: 30,
                                  icon: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0, left: 0),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Color(0xff979797),
                                      )),
                                  items: _addAPageController.categoriesList
                                      .map((CategoriesModel subCategory) {
                                    return DropdownMenuItem<CategoriesModel>(
                                        value: subCategory,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  subCategory.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5,
                                                ),
                                                // Expanded(
                                                //   child: Container(),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ));
                                  }).toList(),
                                  onChanged: (CategoriesModel value) {
                                    setState(() {
                                      ConstantVarable.allAddsOrOne = true;
                                      selectedCategories = value;
                                      dropDownTitleCategory = value.name;
                                    });
                                  })
                            ],
                          ),
                        ),
                        Container(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, bottom: 4.0),
                                child: TextFormFieldW(
                                  textInputType: TextInputType.text,
                                  controller:
                                      ConstantVarable.pagePhoneController,
                                  validator: (val) =>
                                      UserController().validateUserName(val),
                                  hintText: "Enter the phone number",
                                  obSecureText: false,
                                  searchOrKnow: false,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "logo",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Icon(
                                    Icons.camera_enhance,
                                    size: 30,
                                    color: Color(0xff707070),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: <Widget>[
                                  DropdownButton<CityMenu>(
                                      hint: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Text(
                                          dropDownTitleCityMenu,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                      ),
                                      underline: Container(),
                                      value: selectedCityMenu,
                                      iconSize: 30,
                                      icon: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 0, left: 0),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xff979797),
                                          )),
                                      items: _addAPageController.cityList
                                          .map((CityMenu cityMenu) {
                                        return DropdownMenuItem<CityMenu>(
                                            value: cityMenu,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.7,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      cityMenu.name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5,
                                                    ),
                                                    // Expanded(
                                                    //   child: Container(),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                      }).toList(),
                                      onChanged: (CityMenu value) {
                                        setState(() {
                                          ConstantVarable.allAddsOrOne = true;
                                          selectedCityMenu = value;
                                          dropDownTitleCityMenu = value.name;
                                        });
                                      })
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "logo",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Icon(
                                    Icons.camera_enhance,
                                    size: 30,
                                    color: Color(0xff707070),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: TextFormFieldW(
                              textInputType: TextInputType.text,
                              controller: ConstantVarable.pageAddressController,
                              validator: (val) =>
                                  UserController().validateUserName(val),
                              hintText: "Enter the address",
                              obSecureText: false,
                              searchOrKnow: false,
                            ),
                          ),
                        ),
                        Container(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: TextFormFieldW(
                              textInputType: TextInputType.text,
                              controller: ConstantVarable.pageAboutController,
                              validator: (val) =>
                                  UserController().validateUserName(val),
                              hintText: "Enter the about",
                              obSecureText: false,
                              searchOrKnow: false,
                              aboutOrNo: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                " Work time",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 3.2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: <Widget>[
                                  DropdownButton<DayModel>(
                                      hint: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, right: 4),
                                        child: Text(
                                          dropDownTitleDay,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                      ),
                                      underline: Container(),
                                      value: selectedDay,
                                      iconSize: 30,
                                      icon: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 0, left: 0),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xff979797),
                                          )),
                                      items: _addAPageController.dayList
                                          .map((DayModel dayModel) {
                                        return DropdownMenuItem<DayModel>(
                                            value: dayModel,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, right: 4),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      dayModel.name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5,
                                                    ),
                                                    // Expanded(
                                                    //   child: Container(),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                      }).toList(),
                                      onChanged: (DayModel value) {
                                        setState(() {
                                          ConstantVarable.allAddsOrOne = true;
                                          selectedDay = value;
                                          dropDownTitleDay = value.name;
                                        });
                                      })
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: <Widget>[
                                  DropdownButton<TimeHoursModel>(
                                      hint: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Text(
                                          dropDownTitleTimeHours,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                      ),
                                      underline: Container(),
                                      value: selectedTimeHours,
                                      iconSize: 30,
                                      icon: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 0, left: 0),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xff979797),
                                          )),
                                      items: _addAPageController.hoursList
                                          .map((TimeHoursModel hoursModel) {
                                        return DropdownMenuItem<TimeHoursModel>(
                                            value: hoursModel,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    10,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      hoursModel.name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5,
                                                    ),
                                                    // Expanded(
                                                    //   child: Container(),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                      }).toList(),
                                      onChanged: (TimeHoursModel value) {
                                        setState(() {
                                          ConstantVarable.allAddsOrOne = true;
                                          selectedTimeHours = value;
                                          dropDownTitleTimeHours = value.name;
                                        });
                                      })
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: <Widget>[
                                  DropdownButton<TimeMintModel>(
                                      hint: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Text(
                                          dropDownTitleTimeMint,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                      ),
                                      underline: Container(),
                                      value: selectedTimeMint,
                                      iconSize: 30,
                                      icon: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 0, left: 0),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xff979797),
                                          )),
                                      items: _addAPageController.mintList
                                          .map((TimeMintModel mintModel) {
                                        return DropdownMenuItem<TimeMintModel>(
                                            value: mintModel,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    10,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      mintModel.name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5,
                                                    ),
                                                    // Expanded(
                                                    //   child: Container(),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                      }).toList(),
                                      onChanged: (TimeMintModel value) {
                                        setState(() {
                                          ConstantVarable.allAddsOrOne = true;
                                          selectedTimeMint = value;
                                          dropDownTitleTimeMint = value.name;
                                        });
                                      })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          size: 30,
                          color: Theme.of(context).backgroundColor,
                        ),
                        onPressed: () {}),
                  ],
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: isRemember,
                        checkColor: Colors.white,
                        onChanged: (value) {
                          isRemember = value;
                          setState(() {});
                        },
                        activeColor: Theme.of(context).backgroundColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          "_agree".tr(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ],
                  ),
                ),
                UserController().showErrorMsg(),
                isLoading == false
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ButtonW(
                              buttonName: "_send".tr(),
                              sochialOrNormal: 0,
                              width: MediaQuery.of(context).size.width / 2,
                              height: 45,
                              buttonImage: "assets/imgs/send.png",
                              sendOrNot: 1,
                              function: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      )
                    : SharedWidget.loading(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

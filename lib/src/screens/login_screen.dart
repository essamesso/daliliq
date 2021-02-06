import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/src/screens/forgot_password_screen.dart';

import 'package:dalilaq/src/screens/register_screen.dart';
import 'package:dalilaq/src/widgets/SharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:dalilaq/ConstantVarables.dart';
import 'package:dalilaq/src/widgets/TextFormFieldW.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dalilaq/src/widgets/ButtonW.dart';
import 'package:dalilaq/src/screens/pages.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginView();
}

class LoginView extends StateMVC<LoginScreen> {
  LoginView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;
  bool isloading = false;
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //endDrawer: DrawerW().showDrawerUser(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imgs/background.PNG"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 35),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/imgs/languages@3x.png"))),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12,
                  ),
                  child: Image.asset(
                    "assets/imgs/logo.png",
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: MediaQuery.of(context).size.height / 3.5,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Form(
                      key: ConstantVarable.loginformKey,
                      autovalidate: ConstantVarable.loginAutoValid,
                      child: Column(
                        children: <Widget>[
                          TextFormFieldW(
                            textInputType: TextInputType.emailAddress,
                            controller: ConstantVarable.emailController,
                            validator: (val) =>
                                _userController.validateEmail(val),
                            image: "assets/imgs/001-mail@3x.png",
                            hintText: "_email".tr(),
                            obSecureText: false,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey[600],
                          ),
                          TextFormFieldW(
                            textInputType: TextInputType.text,
                            controller: ConstantVarable.passwordController,
                            validator: (val) =>
                                _userController.validatePassword(val),
                            image: "assets/imgs/002-password@3x.png",
                            hintText: "_pass".tr(),
                            obSecureText: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                _userController.showErrorMsg(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: isRemember,
                            checkColor: Theme.of(context).backgroundColor,
                            onChanged: (value) {
                              isRemember = value;
                              setState(() {});
                            },
                            activeColor: Theme.of(context).accentColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "_remember_me".tr(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Container(
                        height: 30,
                        child: Text(
                          "_forgot_pass".tr(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      onTap: () {
                        _userController.clearTextFields();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgotPasswordScreen()));
                      },
                    ),
                  ],
                ),
                isloading == false
                    ? ButtonW(
                        buttonName: "_enter".tr(),
                        buttonImage: "assets/imgs/Group 16@3x.png",
                        height: 45,
                        sochialOrNormal: 0,
                        sendOrNot: 0,
                        function: () {
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => PagesTestWidget()),
                          //     (Route<dynamic> route) => false);

                          setState(() {
                            isloading = true;
                          });
                          _userController
                              .signInWithEmailAndPassword(
                            context,
                            ConstantVarable.emailController.text,
                            ConstantVarable.passwordController.text,
                          )
                              .then((done) {
                            if (done == true) {
                              setState(() {
                                isloading = false;
                              });
                            } else {
                              setState(() {
                                isloading = false;
                              });
                            }
                          });
                        },
                      )
                    : SharedWidget.loading(context),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          height: 30,
                          child: Text(
                            "_create_your_account_Sign_Up".tr(),
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: () {
                          _userController.clearTextFields();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RegisterScreen(
                                        registerOrModify: "register",
                                      )));
                        },
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    isloading == false
                        ? ButtonW(
                            buttonName: "_sign_in".tr(),
                            buttonImage:
                                "assets/imgs/brands-and-logotypes@3x.png",
                            height: 45,
                            width: MediaQuery.of(context).size.width / 2.9,
                            sochialOrNormal: 1,
                            sendOrNot: 0,
                            function: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PagesTestWidget()),
                                  (Route<dynamic> route) => false);
                              // setState(() {
                              //   isloading = true;
                              // });
                              // _userController
                              //     .signInWithEmailAndPassword(
                              //   context,
                              //   ConstantVarable.emailController.text,
                              //   ConstantVarable.passwordController.text,
                              // )
                              //     .then((done) {
                              //   if (done == true) {
                              //     setState(() {
                              //       isloading = false;
                              //     });
                              //   } else {
                              //     setState(() {
                              //       isloading = false;
                              //     });
                              //   }
                              // });
                            },
                          )
                        : SharedWidget.loading(context),
                    isloading == false
                        ? ButtonW(
                            buttonName: "_sign_in".tr(),
                            buttonImage: "assets/imgs/facebook@3x.png",
                            height: 45,
                            width: MediaQuery.of(context).size.width / 2.9,
                            sochialOrNormal: 1,
                            sendOrNot: 0,
                            function: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PagesTestWidget()),
                                  (Route<dynamic> route) => false);
                              // setState(() {
                              //   isloading = true;
                              // });
                              // _userController
                              //     .signInWithEmailAndPassword(
                              //   context,
                              //   ConstantVarable.emailController.text,
                              //   ConstantVarable.passwordController.text,
                              // )
                              //     .then((done) {
                              //   if (done == true) {
                              //     setState(() {
                              //       isloading = false;
                              //     });
                              //   } else {
                              //     setState(() {
                              //       isloading = false;
                              //     });
                              //   }
                              // });
                            },
                          )
                        : SharedWidget.loading(context),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: InkWell(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "_skip".tr(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Container(
                          width: 8,
                        ),
                        Image.asset(
                          "assets/imgs/next@3x.png",
                          width: 25,
                          height: 25,
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PagesTestWidget()));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

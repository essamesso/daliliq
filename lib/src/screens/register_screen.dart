import 'dart:io';

import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:dalilaq/ConstantVarables.dart';
import 'package:dalilaq/src/widgets/ButtonW.dart';
import 'package:dalilaq/src/widgets/SharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:dalilaq/src/widgets/TextFormFieldW.dart';

class RegisterScreen extends StatefulWidget {
  final String registerOrModify;
  RegisterScreen({this.registerOrModify});
  createState() => RegisterView();
}

class RegisterView extends StateMVC<RegisterScreen> {
  RegisterView() : super(UserController()) {
    _userController = UserController.con;
  }
  UserController _userController;
  bool isLoading = false;
  File imageProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/imgs/background.PNG"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 16,
                ),
                widget.registerOrModify == "register"
                    ? Image.asset(
                        "assets/imgs/logo.PNG",
                        width: MediaQuery.of(context).size.width / 1.7,
                      )
                    : InkWell(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: imageProfile == null
                              ? AssetImage("assets/imgs/advimage1@3x.png")
                              : FileImage(imageProfile),
                        ),
                        onTap: () {
// getimageProfile();
                        },
                      ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Form(
                      key: ConstantVarable.regformKey,
                      autovalidate: ConstantVarable.regAutoValid,
                      child: Column(
                        children: <Widget>[
                          TextFormFieldW(
                            textInputType: TextInputType.text,
                            controller: ConstantVarable.userNameController,
                            validator: (val) =>
                                _userController.validateUserName(val),
                            image: "assets/imgs/001-mail@3x.png",
                            hintText: "_email".tr(),
                            obSecureText: false,
                          ),
                          Container(
                            height: 16,
                          ),
                          TextFormFieldW(
                            textInputType: TextInputType.emailAddress,
                            controller: ConstantVarable.emailController,
                            validator: (val) =>
                                _userController.validateEmail(val),
                            image: "assets/imgs/Profile@3x.png",
                            hintText: "_user_name".tr(),
                            obSecureText: false,
                          ),
                          Container(
                            height: 16,
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
                          Container(
                            height: 16,
                          ),
                          TextFormFieldW(
                            textInputType: TextInputType.text,
                            controller:
                                ConstantVarable.confirmPasswordController,
                            validator: (val) =>
                                _userController.validateConfirmPassword(val),
                            image: "assets/imgs/002-password@3x.png",
                            hintText: "_confirm_pass".tr(),
                            obSecureText: true,
                          ),
                          _userController.showErrorMsg(),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 16,
                ),
                isLoading == false
                    ? ButtonW(
                        buttonName: "_sign_Up".tr(),
                        sochialOrNormal: 0,
                        height: 45,
                        buttonImage: "assets/imgs/Group 16@3x.png",
                        sendOrNot: 0,
                        function: () {
                          Navigator.pop(context);
                          // setState(() {
                          //   isLoading = true;
                          // });
                          // _userController
                          //     .regNewUser(
                          //         context,
                          //         ConstantVarable.userNameController.text,
                          //         ConstantVarable.passwordController.text,
                          //         ConstantVarable.emailController.text,
                          //         "aaa",
                          //         ConstantVarable.phoneController.text)
                          //     .then((done) {
                          //   if (done == true) {
                          //     setState(() {
                          //       isLoading = false;
                          //     });
                          //   } else {
                          //     setState(() {
                          //       isLoading = false;
                          //     });
                          //   }
                          // });
                        },
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
  //   Future getimageProfile() async {
  //   var imagex = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     imageProfile = imagex;
  //   });
  //   refresh();

  //   imageProfile.exists().then((yas) {
  //     print(yas);
  //     if (yas) {
  //       //  updateImage();
  //     }
  //   });
  // }
}

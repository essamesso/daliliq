import 'package:dalilaq/src/controllers/UserController.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class TermsScreen extends StatefulWidget {
  createState() => TermsView();
}

class TermsView extends StateMVC<TermsScreen> {
  TermsView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //endDrawer: DrawerW().showDrawerUser(context),
        body: Column(
      children: <Widget>[
        Container(
          height: 25,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
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
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text(
                "The history of fashion design refers specifically to the development of the purpose and intention behind garments, shoes and accessories, and their design and construction. The modern industry, based around firms or fashion houses run by individual designers, started in the 19th century with Charles Frederick Worth who, beginning in 1858, was the first designer to have his label sewn into the garments he created"
                "Before the mid-19th century the division between haute couture and ready-to-wear did not really exist. All but the most basic pieces of female clothing were made-to-measure by dressmakers and seamstresses dealing directly with the client. Most often, clothing was patterned, sewn and tailored in the household",
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        )
      ],
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

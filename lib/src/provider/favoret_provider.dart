import 'package:flutter/cupertino.dart';

class FavoretProvider with ChangeNotifier {
  bool isFavoret = false;
  isFavoretMethod() {
    if (isFavoret == false) {
      isFavoret = true;
    } else {
      isFavoret = false;
    }

    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';

class ColorSelectProvider with ChangeNotifier {
  bool isSelected = false;
  int position;

  isSelectedMethod(int index) {
    position = index;
    if (isSelected == false) {
      isSelected = true;
    } else {
      isSelected = false;
    }

    notifyListeners();
  }
}

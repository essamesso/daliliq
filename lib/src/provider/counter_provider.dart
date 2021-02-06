import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier {
  int counter = 0;
  int position;
  inCrement() {
    counter++;

    notifyListeners();
  }

  deCrement() {
    if (counter > 0) {
      counter--;
    }

    notifyListeners();
  }

  removeCounter() {
    counter = 0;
    notifyListeners();
  }

  getPosition(int index) {
    position = index;
    print(position);
    notifyListeners();
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  bool isAdded = false;
  int position;
  final cartListStream = StreamController.broadcast();
  Stream get getStream => cartListStream.stream;

  final List<Map> cartList = [];
  final List<Map> productList = [
    {
      'disc':
          'ULTRABOOST DFAWEFCW20 SHOESGREGEGEGNMD_R1ULTRABOOST DFAWEFCW20 SHOESGREGEGEGNMD_R1  ',
      'price': 130,
      'id': 1,
      "image": "assets/imgs/Bitmap@3x.png",
      "count": 1,
      "is_added": false
    },
    {
      'disc':
          'ULTRABOOST DFAWEFCW20 SHOESGREGEGEGNMD_R1ULTRABOOST DFAWEFCW20 SHOESGREGEGEGNMD_R1  ',
      'price': 120,
      'id': 2,
      "image": "assets/imgs/Bitmap@3x.png",
      "count": 1,
      "is_added": false
    },
    {
      'disc':
          'ULTRABOOST DFAWEFCW20 SHOESGREGEGEGNMD_R1ULTRABOOST DFAWEFCW20 SHOESGREGEGEGNMD_R1  ',
      'price': 100,
      'id': 3,
      "image": "assets/imgs/Bitmap@3x.png",
      "count": 1,
      "is_added": false
    },
    {
      'disc':
          'ULTRABOOST DFAWEFCW20 SHOESGREGEGEGNMD_R1ULTRABOOST DFAWEFCW20 SHOESGREGEGEGNMD_R1  ',
      'price': 200,
      'id': 4,
      "image": "assets/imgs/Bitmap@3x.png",
      "count": 1,
      "is_added": false
    },
  ];
  void addToCart(item) {
    cartList.add(item);
    cartListStream.sink.add(cartList);
    print("cart list is : $cartList");
  }

  void removeFromCart(item) {
    cartList.remove(item);
    cartListStream.sink.add(cartList);
  }

  getPosition(int index) {
    position = index;
    notifyListeners();
  }

  // int getPriceForAll() {
  //   if (cartList.length > 0) {
  //     for (int i = 0; i > cartList.length; i++) {
  //       int price = cartList[i]['price'];
  //       int counter = cartList[i][]
  //     }
  //   }
  // }

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartListStream.close(); // close our StreamController
  }
}

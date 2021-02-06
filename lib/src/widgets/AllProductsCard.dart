import 'package:dalilaq/src/provider/cart_provider.dart';
import 'package:dalilaq/src/provider/counter_provider.dart';
import 'package:dalilaq/src/widgets/SharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:dalilaq/src/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class AllProductCard extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  final int index;
  AllProductCard({this.data, this.index});
  @override
  _AllProductCardState createState() => _AllProductCardState();
}

class _AllProductCardState extends State<AllProductCard> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    int itemId = widget.data['id'];
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Stack(
            children: <Widget>[
              Container(
                height: 145,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 134,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: AssetImage(widget.data['image']),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 4,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 95,
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: Text(
                              widget.data['disc'],
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      r"$",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                    Text(
                                      widget.data['price'].toString(),
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ],
                                ),
                              ),
                              widget.data['is_added'] == false
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.add_shopping_cart,
                                        size: 30,
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                      onPressed: () {
                                        print(" index is : ${widget.index}");
                                        setState(() {
                                          widget.data['is_added'] = true;
                                        });
                                        cartProvider.getPosition(widget.index);

                                        // if (cartProvider.cartList.length > 0) {
                                        //   for (dynamic element
                                        //       in cartProvider.cartList) {
                                        //     print(
                                        //         "element is : ${element['price']}");

                                        //     if (element['id'] ==
                                        //         widget.data['id']) {
                                        //       print("true");
                                        //     } else {
                                        //       print("false");
                                        //       cartProvider.addToCart(widget.data);
                                        //     }
                                        //   }
                                        // bool exiteng = cartProvider.cartList[0]
                                        //     .containsValue(widget.data['id']);

                                        // if (exiteng == true) {
                                        //   print(" exiting is : $exiteng");
                                        // } else {
                                        //   print(" exiting is : $exiteng");
                                        //   cartProvider.addToCart(widget.data);
                                        // }

                                        // for (int i = 0;
                                        //     i < cartProvider.cartList.length;
                                        //     i++) {
                                        //   if (widget.data['id']==
                                        //       cartProvider.cartList[i]["id"]) {
                                        //     print(
                                        //         "this item is added and his id : ${widget.data['id']}");
                                        //   } else {
                                        //     print("not added");
                                        //     cartProvider.addToCart(widget.data);
                                        //   }
                                        // }
                                        // } else {
                                        // print("cart list is empty");
                                        cartProvider.addToCart(widget.data);
                                        // }
                                      })
                                  : Container()
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
        },
      ),
    );
  }
}

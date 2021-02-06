import 'package:dalilaq/src/provider/cart_provider.dart';
import 'package:dalilaq/src/provider/counter_provider.dart';
import 'package:dalilaq/src/widgets/ButtonW.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color(0xffF5F6F8)),
          child: Column(
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Cart",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder(
                  stream: cartProvider.getStream,
                  builder: (context, snapshot) {
                    print("cart list is : ${cartProvider.cartList}");
                    print("snapshot is : ${snapshot.data}");

                    if (cartProvider.cartList.length > 0) {
                      return Column(
                        children: <Widget>[
                          /// The [checkoutListBuilder] has to be fixed
                          /// in an expanded widget to ensure it
                          /// doesn't occupy the whole screen and leaves
                          /// room for the the RaisedButton
                          Expanded(
                              child: ListView.builder(
                            itemCount: cartProvider.cartList.length,
                            itemBuilder: (BuildContext context, i) {
                              final cartProvider =
                                  Provider.of<CartProvider>(context);
                              final counterProvider =
                                  Provider.of<CounterProvider>(context);

                              String disc = cartProvider.cartList[i]["disc"];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 130,
                                  width: MediaQuery.of(context).size.width,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                  image: AssetImage(cartProvider
                                                      .cartList[i]["image"]))),
                                        ),
                                        Container(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
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
                                                    disc.length > 18
                                                        ? disc.substring(
                                                                0, 18) +
                                                            ".."
                                                        : disc,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
                                                  ),
                                                  IconButton(
                                                      icon: Icon(
                                                        Icons.delete,
                                                        size: 25,
                                                        color: Theme.of(context)
                                                            .backgroundColor,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          cartProvider.cartList[
                                                                      i]
                                                                  ['is_added'] =
                                                              false;
                                                        });
                                                        cartProvider
                                                            .removeFromCart(
                                                                cartProvider
                                                                    .cartList[i]);
                                                      })
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2, bottom: 2),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    r"$",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4,
                                                  ),
                                                  Text(
                                                    cartProvider.cartList[i]
                                                            ["price"]
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  InkWell(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.asset(
                                                        "assets/imgs/Group 30@3x.png",
                                                        width: 20,
                                                        height: 20,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        if (cartProvider
                                                                    .cartList[i]
                                                                ['count'] >
                                                            1) {
                                                          cartProvider
                                                                  .cartList[i]
                                                              ['count']--;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: Text(
                                                      cartProvider.cartList[i]
                                                              ['count']
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline4,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.asset(
                                                        "assets/imgs/Group 29@3x.png",
                                                        width: 20,
                                                        height: 20,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        cartProvider.cartList[i]
                                                            ['count']++;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )

                                  //  ListTile(
                                  //   title: Text(cartList[i]['name']),
                                  //   subtitle: Text("\$${cartList[i]['price']}"),
                                  //   trailing: IconButton(
                                  //     icon: Icon(Icons.remove_shopping_cart),
                                  //     onPressed: () {
                                  //       bloc.removeFromCart(cartList[i]);
                                  //     },
                                  //   ),
                                  //   onTap: () {},
                                  // )

                                  ;
                            },
                          )),
                        ],
                      );
                    } else {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Text(
                          "You haven't taken any item yet",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ));
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Sub total",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      r"$140",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Tax",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      r"$6",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "TOTAL",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          r"$ 140",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    ButtonW(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 45,
                      sendOrNot: 1,
                      sochialOrNormal: 0,
                      buttonName: "CHECKOUT",
                      buttonImage: "assets/imgs/Group 16@3x.png",
                      function: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dalilaq/src/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class NewProductCard extends StatefulWidget {
  @override
  _NewProductCardState createState() => _NewProductCardState();
}

class _NewProductCardState extends State<NewProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.9,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width / 2.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                        image: AssetImage("assets/imgs/Bitmap@3x.png"),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "NEW PRODUCT",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      r"$130",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
      },
    );
  }
}

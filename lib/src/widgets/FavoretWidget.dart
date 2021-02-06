import 'package:dalilaq/src/provider/favoret_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoretW extends StatefulWidget {
  @override
  _FavoretWState createState() => _FavoretWState();
}

class _FavoretWState extends State<FavoretW> {
  @override
  Widget build(BuildContext context) {
    final favoretProvider = Provider.of<FavoretProvider>(context);
    return IconButton(
        icon: Icon(
          favoretProvider.isFavoret == false
              ? Icons.favorite_border
              : Icons.favorite,
          color: favoretProvider.isFavoret == false
              ? Color(0xff707070)
              : Theme.of(context).backgroundColor,
          size: 30,
        ),
        onPressed: () {
          favoretProvider.isFavoretMethod();
        });
  }
}

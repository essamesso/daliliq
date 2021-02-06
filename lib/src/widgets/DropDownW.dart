import 'package:dalilaq/ConstantVarables.dart';
import 'package:flutter/material.dart';

class DropDownW extends StatefulWidget {
  var model;
  var selectedModel;
  var list;
  String dropDownTitle;
  double width;
  double height;
  DropDownW(
      {this.model,
      this.selectedModel,
      this.list,
      this.dropDownTitle,
      this.width,
      this.height});
  @override
  _DropDownWState createState() => _DropDownWState();
}

class _DropDownWState extends State<DropDownW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      // child: Row(
      //   children: <Widget>[
      //     DropdownButton<widget.model>(
      //         hint: Padding(
      //           padding: const EdgeInsets.only(left: 8, right: 8),
      //           child: Text(
      //             widget.dropDownTitle,
      //             style: Theme.of(context).textTheme.headline5,
      //           ),
      //         ),
      //         underline: Container(),
      //         value: widget.selectedModel,
      //         iconSize: 30,
      //         icon: Padding(
      //             padding: const EdgeInsets.only(right: 0, left: 0),
      //             child: Icon(
      //               Icons.arrow_drop_down,
      //               color: Color(0xff979797),
      //             )),
      //         items: widget.list.map((widget.model model) {
      //           return DropdownMenuItem<widget.model>(
      //               value: model,
      //               child: Padding(
      //                 padding: const EdgeInsets.only(left: 8, right: 8),
      //                 child: Container(
      //                   width: MediaQuery.of(context).size.width / 1.5,
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: <Widget>[
      //                       Text(
      //                         model.name,
      //                         style: Theme.of(context).textTheme.headline5,
      //                       ),
      //                       // Expanded(
      //                       //   child: Container(),
      //                       // ),
      //                     ],
      //                   ),
      //                 ),
      //               ));
      //         }).toList(),
      //         onChanged: (widget.model value) {
      //           setState(() {
      //             widget.selectedModel = value;
      //             widget.dropDownTitle = value.name;
      //           });
      //         })
      //   ],
      // ),
    );
  }
}

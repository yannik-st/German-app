import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SepLine extends StatelessWidget{
  SepLine();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Container _retContainer = Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(15),
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
//            top: BorderSide(width: 1, color: Colors.grey)
        ),
      ),
    );

    return _retContainer;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Underline extends StatelessWidget{
  final String text;

  Underline(String text):
    text = text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Container _retContainer = Container(
      width: MediaQuery.of(context).size.width/3,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1, color: Color.fromRGBO(190, 38, 38, 1.0)),
//            top: BorderSide(width: 1, color: Colors.grey)
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
            ),
      ),
    );

    return _retContainer;
  }
}
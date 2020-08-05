import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget{
  final String text;

  TextBox(String text):
    text = text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Container _retContainer = Container(
      color: Colors.black,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold),
      ),
    );

    return _retContainer;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'db_words.dart';

class HideBox extends StatefulWidget {
  final String hide;
  final Word content;

  HideBox({Key key, @required this.hide, @required this.content}) : super(key: key);

  @override
  _HideBox createState() => _HideBox(hide, content);
}

class _HideBox extends State<HideBox> {
  final String hide;
  final Word content;

  _HideBox(this.hide, this.content);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 0.2 * MediaQuery.of(context).size.width,
      child: MaterialButton(
        color: Colors.red,
        onPressed: () {

        },
      ),
    );
  }
}

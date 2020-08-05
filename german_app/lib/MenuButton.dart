import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  //final String text;
  final GestureTapCallback onPressed;

  MenuButton({@required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: Colors.blue,
        splashColor: Colors.lightBlue,
        child: Text('hallo'),
        onPressed: onPressed,
    );
  }
}
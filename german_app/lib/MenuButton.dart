import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;

  MenuButton({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.8 * MediaQuery.of(context).size.width,
      height: 0.12 * MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(15),
        border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey),
          top: BorderSide(width: 1, color: Colors.grey)
        ),
      ),
      child: ClipRRect(
        //borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: RawMaterialButton(
            splashColor: Colors.white70,
            child: Text(
              text,
              style: TextStyle(fontSize: 35),
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  final IconData icon;

  NormalButton({@required this.onPressed, @required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1 * MediaQuery.of(context).size.width,
      height: 0.07 * MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(15),
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: RawMaterialButton(
        splashColor: Colors.yellow,
        onPressed: onPressed,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            ),
            Icon(
              icon,
              size: 40,
            ),
            Text(
              '  ' + text,
              style: TextStyle(fontSize: 28),
            )
          ]),
        ),
      ),
    );
  }
}

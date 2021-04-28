import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LectureButton extends StatelessWidget {
  final String title;
  final String text;
  final GestureTapCallback onPressed;

  LectureButton({@required this.onPressed, @required this.text, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 0.8 * MediaQuery.of(context).size.width,
          height: 0.12 * MediaQuery.of(context).size.height,
          // decoration: BoxDecoration(
          //   //borderRadius: BorderRadius.circular(15),
          //   border: Border(
          //     bottom: BorderSide(width: 1, color: Colors.grey),
          //   ),
          // ),
          child: RawMaterialButton(
            fillColor: Colors.cyan[900],
            splashColor: Colors.white,
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  )
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        )
      ],
    );
  }
}

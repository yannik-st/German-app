import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;

  MenuButton({@required this.onPressed,@required this.text});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.6*MediaQuery.of(context).size.width,
      height: 0.1*MediaQuery.of(context).size.height,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: RawMaterialButton(
              splashColor: Colors.white70,
              child: Text(text),
              onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
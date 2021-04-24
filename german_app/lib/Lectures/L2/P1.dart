import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class P1 extends StatelessWidget {
  P1();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Text('page 1 BUT LECTURE 2', style: TextStyle(fontSize: 33)),
        Text(
            'A lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of text',
            style: TextStyle(fontSize: 28)),
        Text('- how does this look? -'),
        Text(
            'A lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of text',
            style: TextStyle(fontSize: 28)),
        Text('- how does this look? -'),
        Text(
            'A lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of text',
            style: TextStyle(fontSize: 28)),
      ],
    );
  }
}

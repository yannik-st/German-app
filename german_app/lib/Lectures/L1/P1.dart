import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class P1 extends StatelessWidget {
  P1();

  onPressed(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event anything'),
          content: Text('some content whatever'),
          actions: <Widget>[
            Row(children: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Not Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Text('page 1', style: TextStyle(fontSize: 33)),
        RawMaterialButton(
          onPressed: () => onPressed(context),
          child: Container(
            color: Colors.yellow,
            child: Text(
              'Button',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
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

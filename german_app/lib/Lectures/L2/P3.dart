import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class P3 extends StatelessWidget {
  P3();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Text('page 3 BUT LECTURE 2', style: TextStyle(fontSize: 33)
        ),
        Text('A lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of text'
        ),
        Text('- how does this look? -'
        ),
        Text('A lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of textA lot of text'
        ),
      ],
    );
  }
}

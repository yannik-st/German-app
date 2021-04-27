import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:german_app/Lectures/LectureTools.dart';

class P2 extends StatelessWidget {
  P2();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        HeadLine(text: 'Direct/indirect article'),
        SelectableText('While our first examples only used nouns where the gender seems quite obvious (man - masculine, women - feminine ..) we have to accept that for the most nouns the gender will not be obvious and can even be counterintuitive.'),
        SelectableText('''The following example shall demonstrate this:\n'''),
        Row(
          children: [
            SelectableText.rich(
              TextSpan(
                text: '',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: "the apple\n"),
                  TextSpan(text: "the person\n"),
                  TextSpan(text: "the girl\n"),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 0)),
            SelectableText.rich(
              TextSpan(
                text: '',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: "- "),
                  highlight_TS('der ', Colors.deepOrange),
                  TextSpan(text: "Apfel "),
                  highlight_TS('[m]\n', Colors.deepOrange),
                  TextSpan(text: "- "),
                  highlight_TS('die ', Colors.deepOrange),
                  TextSpan(text: "Person "),
                  highlight_TS('[f]\n', Colors.deepOrange),
                  TextSpan(text: "- "),
                  highlight_TS('das ', Colors.deepOrange),
                  TextSpan(text: "Mädchen "),
                  highlight_TS('[n]\n', Colors.deepOrange),
                ],
              ),
            ),
          ],
        ),
        SelectableText.rich(
          TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: 'Since there is no rule for this, we will simply have to learn the gender of any noun by heart. The easiest way to do this, is to learn the noun in combination with its respective article, whenever we learn a new noun.\n\n'),
              TextSpan(text: 'Move on to the next page, where we will learn about plural of nouns.')
            ],
          ),
        ),
      ],
    );
  }
}

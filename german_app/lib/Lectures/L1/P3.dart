import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:german_app/Lectures/LectureTools.dart';

class P3 extends StatelessWidget {
  P3();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        HeadLine(text: 'Articles and plural'),
        SelectableText.rich(
          TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: 'For nouns in '),
              highlight_TS('plural form', Colors.blue),
              TextSpan(text: ' we always use the article '),
              highlight_TS('"die"', Colors.blue),
              TextSpan(text: '.\n'),
            ],
          ),
        ),
        Row(
          children: [
            SelectableText.rich(
              TextSpan(
                text: '',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: "the men\n"),
                  TextSpan(text: "the women\n"),
                  TextSpan(text: "the children\n"),
                  TextSpan(text: "the apples\n"),
                  TextSpan(text: "the persons\n"),
                  TextSpan(text: "the girls\n"),
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
                  highlight_TS('die ', Colors.blue),
                  TextSpan(text: "Männer "),
                  highlight_TS('[m]\n', Colors.blue),
                  TextSpan(text: "- "),
                  highlight_TS('die ', Colors.blue),
                  TextSpan(text: "Frauen "),
                  highlight_TS('[f]\n', Colors.blue),
                  TextSpan(text: "- "),
                  highlight_TS('die ', Colors.blue),
                  TextSpan(text: "Kinder "),
                  highlight_TS('[n]\n', Colors.blue),
                  TextSpan(text: "- "),
                  highlight_TS('die ', Colors.blue),
                  TextSpan(text: "Äpfel "),
                  highlight_TS('[m]\n', Colors.blue),
                  TextSpan(text: "- "),
                  highlight_TS('die ', Colors.blue),
                  TextSpan(text: "Personen "),
                  highlight_TS('[f]\n', Colors.blue),
                  TextSpan(text: "- "),
                  highlight_TS('die ', Colors.blue),
                  TextSpan(text: "Mädchen "),
                  highlight_TS('[n]\n', Colors.blue),

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
                  text: 'The above examples shows how the plural form always uses the same article for every noun, regardless of the gender.\n\n'),
              TextSpan(text: 'Looking at the examples we can also see that the plural is built in various ways and does not follow easy rules (and comes with many exceptions). For this reason it makes sense to learn the plural by heart for every noun.\n\n'),
              TextSpan(text: 'Summarizing the first lecture we now learned that nouns come with three different genders and correspondingly use different articles. Another point is that both, the gender (article) and plural of a noun can not be reliably predicted, so that we have to learn those too, whenever we pick up a new noun.')
            ],
          ),
        ),
      ],
    );
  }
}

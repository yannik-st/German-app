import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:german_app/Lectures/LectureTools.dart';

class P4 extends StatelessWidget {
  P4();

  final List<String> en = ['the man', 'the woman', 'the children', 'the apple', 'the person', 'the girl'];
  final List<String> de = ['der Mann', 'die Frau', 'das Kind', 'der Apfel', 'die Person', 'das Mädchen'];
  final List<String> de_else = ['die Männer', 'die Frauen', 'die Kinder', 'die Äpfel', 'die Personen', 'die Mädchen'];


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        HeadLine(text: 'Vocabulary'),
        SelectableText.rich(
          TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: 'Each lecture will introduce some new vocabulary, which will be summarized on the last page. '),
              TextSpan(text: 'Once you finished the lecture with pressing "finish", the new vocabulary will be added to your "lecture vocabulary" and can then be further studied in the "Practice" section.\n'),
            ],
          ),
        ),
        vocList(en, de, de_else),
      ],
    );
  }
}

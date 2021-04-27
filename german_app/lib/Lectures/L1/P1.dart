import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:german_app/Lectures/LectureTools.dart';

class P1 extends StatefulWidget {
  P1();

  @override
  _P1 createState() => _P1();
}

class _P1 extends State<P1> {
  _P1();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        HeadLine(text: 'Direct/indirect article'),
        SelectableText.rich(
          TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              colorString_TS(
                  'The first thing we want to learn about are the direct and indirect articles of nouns. In German there are three different genders a noun can have: Masculine, feminine or neuter.\n',
                  'Masculine, feminine or neuter',
                  Colors.blue),
              colorString_TS(
                  'And depending on the gender we have to use a different article.\n',
                  'different article',
                  Colors.blue),
              TextSpan(
                  text:
                      '''In fact, aside of the gender the article also has to be adjusted to the so called "case", but let's keep things simple and stick to the "nominative"-case for now (we will come back to this later in lecture X)\n\n''',
                  style: TextStyle(color: Colors.grey)),
              TextSpan(
                  text:
                      'This is different to English, where we use the direct article '),
              highlight_TS('"the" ', Colors.blue),
              TextSpan(text: 'and the indirect article '),
              highlight_TS('"a/an" ', Colors.blue),
              TextSpan(text: 'for every noun.\n\n'),
              TextSpan(
                  text:
                      "The following table summarizes the direct and indirect articles we have to use for the different genders:\n"),
            ],
          ),
        ),
        Table(
          defaultColumnWidth: FixedColumnWidth(120.0),
          border: TableBorder.all(
              color: Colors.black, style: BorderStyle.solid, width: 1),
          children: [
            TableRow(children: [
              Column(children: [Text('')]),
              Column(children: [
                SelectableText('direct',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]),
              Column(children: [
                SelectableText('indirect',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]),
            ]),
            TableRow(children: [
              Column(children: [
                SelectableText('masculine [m]',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]),
              Column(children: [SelectableText('der')]),
              Column(children: [SelectableText('ein')]),
            ]),
            TableRow(children: [
              Column(children: [
                SelectableText('feminine [f]',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]),
              Column(children: [SelectableText('die')]),
              Column(children: [SelectableText('eine')]),
            ]),
            TableRow(children: [
              Column(children: [
                SelectableText('neuter [n]',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]),
              Column(children: [SelectableText('das')]),
              Column(children: [SelectableText('ein')]),
            ]),
          ],
        ),
        SelectableText(
            "\nNow let's have a few examples and learn our first words meanwhile:\n"),
        highlight_Text('Direct:', Colors.black),
        Row(
          children: [
            SelectableText.rich(
              TextSpan(
                text: '',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: "the man\n"),
                  TextSpan(text: "the woman\n"),
                  TextSpan(text: "the child\n"),
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
                  highlight_TS('der ', Colors.blue),
                  TextSpan(text: "Mann "),
                  highlight_TS('[m]\n', Colors.blue),
                  TextSpan(text: "- "),
                  highlight_TS('die ', Colors.blue),
                  TextSpan(text: "Frau "),
                  highlight_TS('[f]\n', Colors.blue),
                  TextSpan(text: "- "),
                  highlight_TS('das ', Colors.blue),
                  TextSpan(text: "Kind "),
                  highlight_TS('[n]\n', Colors.blue),
                ],
              ),
            ),
          ],
        ),
        highlight_Text('Indirect:', Colors.black),
        Row(
          children: [
            SelectableText.rich(
              TextSpan(
                text: '',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: "a man\n"),
                  TextSpan(text: "a woman\n"),
                  TextSpan(text: "a child\n"),
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
                  highlight_TS('ein ', Colors.blue),
                  TextSpan(text: "Mann "),
                  highlight_TS('[m]\n', Colors.blue),
                  TextSpan(text: "- "),
                  highlight_TS('eine ', Colors.blue),
                  TextSpan(text: "Frau "),
                  highlight_TS('[f]\n', Colors.blue),
                  TextSpan(text: "- "),
                  highlight_TS('ein ', Colors.blue),
                  TextSpan(text: "Kind "),
                  highlight_TS('[n]\n', Colors.blue),
                ],
              ),
            ),
          ],
        ),
        SelectableText(
            'Side note: Note how in German not only names, but all nouns have to be written with an initial capital letter.\n',
            style: TextStyle(color: Colors.deepOrangeAccent)),
        Text(
          'The lecture continues on the next side (bottom right arrow)',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}

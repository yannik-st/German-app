import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:german_app/NormalButton.dart';

class HeadLine extends StatelessWidget {
  final String text;

  HeadLine({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: 0.75 * MediaQuery.of(context).size.width,
        //height: 0.07 * MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(15),
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      ),
    ]);
  }
}

class LectureText extends StatelessWidget {
  final String text;

  LectureText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return null;
  }
}

TextSpan highlight_TS(String text, Color color) {
  return TextSpan(
      text: text, style: TextStyle(fontWeight: FontWeight.bold, color: color));
}

SelectableText highlight_Text(String text, Color color) {
  return SelectableText(text,
      style: TextStyle(fontWeight: FontWeight.bold, color: color));
}

ListView vocList(List<String> english_vocs, List<String> german_vocs,
    List<String> german_else) {

  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: german_vocs.length,
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(15),
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey[300]),
          ),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: SelectableText(english_vocs.elementAt(index)),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(german_vocs.elementAt(index)),
                    SelectableText(
                      german_else.elementAt(index),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ]),
      );
    },
  );
}

TextSpan colorString_TS(String text, String s, Color color) {
  String whole_string = text;

  // String whole_string = "the quick brown fox jumps over the lazy dog";

  int s_index = whole_string.indexOf(s);

  String t1 = whole_string.substring(0, s_index);
  String t2 = s;
  String t3 = whole_string.substring(s_index + s.length, whole_string.length);

  TextSpan colored_text = TextSpan(
    text: '',
    children: <TextSpan>[
      TextSpan(text: t1),
      TextSpan(text: t2, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
      TextSpan(text: t3)
    ],
  );

  return colored_text;
}
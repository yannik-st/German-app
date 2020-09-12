import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'db_words.dart';

class DisplayedWord extends StatefulWidget {
  final Word word;

  DisplayedWord({Key key, @required this.word}) : super(key: key);

  @override
  _DisplayedWord createState() => _DisplayedWord(word);
}

class _DisplayedWord extends State<DisplayedWord> {
  final Word word;

  _DisplayedWord(this.word) {
//    print(word);
  }

  bool _learned = false;

  String article(String gender) {
    String retString = '';
    if (gender == 'masculine') {
      retString = 'der ';
    } else if (gender == 'feminine') {
      retString = 'die ';
    } else if (gender == 'neuter') {
      retString = 'das ';
    }
    return retString;
  }

  Widget germanSection(Word word) {
    bool hasSecondLine = true;
    Widget _secondLine = Text('');
    Widget _box = Container();

    if (word.type == 'noun') {
      if (word.plural != "" && word.plural != null) {
        _secondLine =
            Text('die ' + word.plural, style: TextStyle(color: Colors.grey));
      }
      else{
        hasSecondLine = false;
      }
    } else if (word.type == 'verb' || word.type == 'preposition') {
      _secondLine = Text(word.gcase, style: TextStyle(color: Colors.grey),);
    } else {
      hasSecondLine = false;
    }

    if (hasSecondLine == true) {
      _box = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(article(word.gender) + word.german),
        _secondLine,
      ]);
    } else {
      _box = Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(article(word.gender) + word.german),
      ]);
    }

    return Container(
      alignment: Alignment.centerLeft,
      child: RawMaterialButton(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _box,
//            Text(article(word.gender) + word.german),
//            _secondLine,
            ],
          ),
        ),
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text(word.german),
              content: Text(word.additional),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(15),
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
//            top: BorderSide(width: 1, color: Colors.grey)
        ),
      ),
      child: Row(children: [
        Flexible(
          flex: 1,
          child: Checkbox(
            value: _learned,
            onChanged: (val) {
              setState(() {
                _learned = !_learned;
              });
            },
          ),
        ),
        Flexible(
          flex: 4,
          fit: FlexFit.tight,
          child: germanSection(word),
        ),
        Flexible(
          flex: 3,
          child: Text(word.english),
        ),
//        Flexible(
//          flex: 3,
//          child: Text(),
//        )
      ]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'db_words.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DisplayedWord extends StatefulWidget {
  final Word word;
  final hidden;

  DisplayedWord({Key key, @required this.word, this.hidden}) : super(key: key);

  @override
  _DisplayedWord createState() => _DisplayedWord(word, hidden);
}

class _DisplayedWord extends State<DisplayedWord> {
  final Word word;
  String hidden;
  final FlutterTts flutterTts = FlutterTts();

  _DisplayedWord(this.word, this.hidden) {
    flutterTts.setLanguage('de-DE');
  }

  bool _learned = false;

  Future speak() async{
    String article = '';
    if(word.type == 'noun'){
      if (word.gender == 'masculine') {
        article = 'der ';
      } else if (word.gender == 'feminine') {
        article = 'die ';
      } else if (word.gender == 'neuter') {
        article = 'das ';
      }

    }
    print(await flutterTts.getLanguages);
    await flutterTts.speak(article+word.german);
  }

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

  Widget germanSection() {
    bool hasSecondLine = true;
    Widget _secondLine = Text('');
    Widget _box = Container();

    if (word.type == 'noun') {
      if (word.plural != "" && word.plural != null) {
        _secondLine =
            Text('die ' + word.plural, style: TextStyle(color: Colors.grey));
      } else {
        hasSecondLine = false;
      }
    } else if (word.type == 'verb' || word.type == 'preposition') {
      _secondLine = Text(
        word.gcase,
        style: TextStyle(color: Colors.grey),
      );
    } else {
      hasSecondLine = false;
    }

    if (hasSecondLine == true) {
      _box = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(article(word.gender) + word.german),
        _secondLine,
      ]);
    } else {
      _box = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(article(word.gender) + word.german),
      ]);
    }

    return Container(
      alignment: Alignment.centerLeft,
      child: hidden == 'german'
          ? RawMaterialButton(
              fillColor: Colors.grey[300],
              child: Text('Show'),
              onPressed: () {
                setState(() {
                  hidden = 'none';
                });
              },
            )
          : RawMaterialButton(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _box,
                  ],
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
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
                  },
                );
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
          child: Container(
            child: MaterialButton(
              child: Icon(Icons.volume_up, color: Colors.black45,),
              onPressed: () => speak(),
            ),
          ),
        ),
        Flexible(
          flex: 4,
          fit: FlexFit.tight,
          child: germanSection(),
        ),
        Flexible(
          flex: 3,
          child: hidden == 'english'
              ? RawMaterialButton(
                  fillColor: Colors.grey[300],
                  child: Text('Show'),
                  onPressed: () {
                    setState(() {
                      hidden = 'none';
                    });
                  },
                )
              : Text(word.english),
        ),
//        Flexible(
//          flex: 3,
//          child: Text(),
//        )
      ]),
    );
  }
}

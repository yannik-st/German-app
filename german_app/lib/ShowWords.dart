import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:german_app/SepLine.dart';
import 'NormalButton.dart';
import 'db_words.dart';
import 'Underline.dart';
import 'DisplayWords.dart';

void _something() async {
  print(await rawQuery(
      'SELECT * FROM words WHERE type="noun" AND gender="feminine"'));
}

void _displayWordsPressed(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DisplayWords()),
  );
}

//Future<void> _something() async {
//  var fido = Word(
//    german: 0,
//    english: 'Fido',
//    gender: 35,
//  );
//
//  // Insert a word into the database.
//  await insertWord(fido);
//
//  // Print the list of words (only Fido for now).
//  print(await words());
//
//  // Update Fido's age and save it to the database.
//  fido = Word(
//  german: fido.german,
//  english: fido.english,
//  gender: fido.gender + 7,
//  );
//  await updateWord(fido);
//
//  // Print Fido's updated information.
//  print(await words());
//
//  // Delete Fido from the database.
//  await deleteWord(fido.german);
//
//  // Print the list of words (empty).
//  print(await words());
//
//}

class ShowWords extends StatefulWidget {
  ShowWords({Key key}) : super(key: key);

  @override
  _ShowWords createState() => _ShowWords();
}

class _ShowWords extends State<ShowWords> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _inputN = TextEditingController(text: '15');
  String _radioType = 'any';
  String _radioHide = 'none';

  void _displayWordsPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DisplayWords()),
    );
  }

  Widget _configSection() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Flexible(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' Type:',
              style: TextStyle(fontSize: 24),
            ),
            Row(
              children: [
                Radio(
                  groupValue: _radioType,
                  value: 'any',
                  onChanged: (val) {
                    setState(() {
                      _radioType = val;
                    });
                  },
                ),
                Text('Any'),
              ],
            ),
            Row(
              children: [
                Radio(
                  groupValue: _radioType,
                  value: 'noun',
                  onChanged: (val) {
                    setState(() {
                      _radioType = val;
                    });
                  },
                ),
                Text('Nouns'),
              ],
            ),
            Row(
              children: [
                Radio(
                  groupValue: _radioType,
                  value: 'verb',
                  onChanged: (val) {
                    setState(() {
                      _radioType = val;
                    });
                  },
                ),
                Text('Verbs'),
              ],
            ),
            Row(
              children: [
                Radio(
                  groupValue: _radioType,
                  value: 'adjective',
                  onChanged: (val) {
                    setState(() {
                      _radioType = val;
                    });
                  },
                ),
                Text('Adjective'),
              ],
            ),
            Row(
              children: [
                Radio(
                  groupValue: _radioType,
                  value: 'preposition',
                  onChanged: (val) {
                    setState(() {
                      _radioType = val;
                    });
                  },
                ),
                Text('Prepositions'),
              ],
            ),
            Row(
              children: [
                Radio(
                  groupValue: _radioType,
                  value: 'pronoun',
                  onChanged: (val) {
                    setState(() {
                      _radioType = val;
                    });
                  },
                ),
                Text('Pronoun'),
              ],
            ),
            Row(
              children: [
                Radio(
                  groupValue: _radioType,
                  value: 'other',
                  onChanged: (val) {
                    setState(() {
                      _radioType = val;
                    });
                  },
                ),
                Text('Others'),
              ],
            ),
          ],
        ),
      ),
      Flexible(
        flex: 5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color.fromRGBO(190, 38, 38, 1.0),
              width: 1,
              height: 370,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        ' Amount:  ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      width: 65,
                      child: TextField(
                        controller: _inputN,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(),
                            borderSide:
                                BorderSide(width: 0, color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      ' Hide:  ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                            groupValue: _radioHide,
                            value: 'none',
                            onChanged: (val) {
                              setState(() {
                                _radioHide = val;
                              });
                            },
                          ),
                          Text(
                            'none',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            groupValue: _radioHide,
                            value: 'german',
                            onChanged: (val) {
                              setState(() {
                                _radioHide = val;
                              });
                            },
                          ),
                          Text(
                            'german',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            groupValue: _radioHide,
                            value: 'english',
                            onChanged: (val) {
                              setState(() {
                                _radioHide = val;
                              });
                            },
                          ),
                          Text(
                            'english',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Display Words',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
        ),
        backgroundColor: Colors.white70,
      ),
      body: Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          Underline(' Configure: '),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          ),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _configSection(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Container(
                  width: 0.5 * MediaQuery.of(context).size.width,
                  height: 0.08 * MediaQuery.of(context).size.height,
                  child: MaterialButton(
                    onPressed: _displayWordsPressed,
                    splashColor: Colors.grey,
                    color: Colors.white30,
                    child: Text(
                      'Display',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

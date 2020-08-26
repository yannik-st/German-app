import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:german_app/SepLine.dart';
import 'NormalButton.dart';
import 'db_words.dart';
import 'Underline.dart';

void _something() {}

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
  TextEditingController _inputGerman = TextEditingController();
  TextEditingController _inputEnglish = TextEditingController();
  TextEditingController _inputAdditional = TextEditingController();
  String _radioType = '';
  String _radioGender = '';
  String _radioCase = '';

  Widget _genderSection(type) {
    if(type == 'noun'){

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Underline(' Gender: '),
          Row(children: <Widget>[
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Radio(
                    groupValue: _radioGender,
                    value: 'masculine',
                    onChanged: (val) {
                      setState(() {
                        _radioGender = val;
                      });
                    },
                  ),
                  Text('Masculine'),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Radio(
                    groupValue: _radioGender,
                    value: 'feminine',
                    onChanged: (val) {
                      setState(() {
                        _radioGender = val;
                      });
                    },
                  ),
                  Text('Feminine'),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Radio(
                    groupValue: _radioGender,
                    value: 'neuter',
                    onChanged: (val) {
                      setState(() {
                        _radioGender = val;
                      });
                    },
                  ),
                  Text('Neuter'),
                ],
              ),
            ),
          ]),
          SepLine(),
          Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
        ],
      );

    }
    else return Padding(
      padding: EdgeInsets.all(0.0),
    );
  }

  Widget _caseSection(type) {
    if(type == 'verb' || type == 'preposition'){

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Underline(' Case: '),
          Row(children: <Widget>[
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Radio(
                    groupValue: _radioCase,
                    value: 'accusative',
                    onChanged: (val) {
                      setState(() {
                        _radioCase = val;
                      });
                    },
                  ),
                  Text('Accusative'),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Radio(
                    groupValue: _radioCase,
                    value: 'dative',
                    onChanged: (val) {
                      setState(() {
                        _radioCase = val;
                      });
                    },
                  ),
                  Text('Dative'),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Radio(
                    groupValue: _radioCase,
                    value: 'nominative',
                    onChanged: (val) {
                      setState(() {
                        _radioCase = val;
                      });
                    },
                  ),
                  Text('Nominative'),
                ],
              ),
            ),
          ]),
          SepLine(),
          Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
        ],
      );

    }
    else return Padding(
      padding: EdgeInsets.all(0.0),
    );
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
        child: ListView(
            children: <Widget>[ Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Underline(
                  ' Test: ',
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 16, 0, 0),
                  child: RaisedButton(
                    onPressed: () async {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // Show all words of the database.
                        print(await words());
                      }
                    },
                    color: Colors.yellow,
                    child: Text('Display Words'),
                  ),
                ),
              ],
            ),
            ]),
      ),
    );
  }
}

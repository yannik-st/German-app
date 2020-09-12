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
//
//showDialog(context: context, builder: (BuildContext context) {
//return AlertDialog(
//title: Text(newWord.german),
//content: Text(
//'german: '+ _inputGerman.text +'\n'+
//'plural: '+_inputPlural.text +'\n'+
//'english: '+_inputEnglish.text +'\n'+
//'type: '+_radioType +'\n'+
//'gender: '+_radioGender +'\n'+
//'gcase: '_radioCase +'\n'+
//'additional:'+_inputAdditional.text),
//actions: <Widget>[
//FlatButton(
//child: Text('Ok'),
//onPressed: () {
//Navigator.of(context).pop();
//},
//),
//],
//);
//},);

class AddWord extends StatefulWidget {
  AddWord({Key key}) : super(key: key);

  @override
  _AddWord createState() => _AddWord();
}

class _AddWord extends State<AddWord> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _inputGerman = TextEditingController();
  TextEditingController _inputEnglish = TextEditingController();
  TextEditingController _inputAdditional = TextEditingController();
  TextEditingController _inputPlural = TextEditingController();
  String _radioType = '';
  String _radioGender = '';
  String _radioCase = '';

  displayWord(Word newWord){
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text(newWord.german),
        content: Text('german: '+ newWord.german),
        actions: <Widget>[
          Row( children: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]),
        ],
      );
    },);
  }

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
          Row(children: <Widget>[
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Radio(
                    groupValue: _radioCase,
                    value: 'dative_accusative',
                    onChanged: (val) {
                      setState(() {
                        _radioCase = val;
                      });
                    },
                  ),
                  Text('Dative & Accusative'),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Radio(
                    groupValue: _radioCase,
                    value: 'none',
                    onChanged: (val) {
                      setState(() {
                        _radioCase = val;
                      });
                    },
                  ),
                  Text('None'),
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

  Widget _pluralSection(type){
    if(type == 'noun'){
      return TextFormField(

        controller: _inputPlural,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(),
            borderSide: BorderSide(width: 0, color: Colors.grey),
          ),
          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          hintText: '...German plural',
        ),
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
          'Add Word',
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
//              Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
              Underline(
                ' Type: ',
              ),
              Row(children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Radio(
                        groupValue: _radioType,
                        value: 'noun',
                        onChanged: (val) {
                          setState(() {
                            _radioType = val;
                            _radioGender = '';
                            _radioCase = '';
                          });
                        },
                      ),
                      Text('Noun'),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Radio(
                        groupValue: _radioType,
                        value: 'verb',
                        onChanged: (val) {
                          setState(() {
                            _radioType = val;
                            _radioGender = '';
                            _radioCase = '';
                          });
                        },
                      ),
                      Text('Verb'),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Radio(
                        groupValue: _radioType,
                        value: 'adjective',
                        onChanged: (val) {
                          setState(() {
                            _radioType = val;
                            _radioGender = '';
                            _radioCase = '';
                          });
                        },
                      ),
                      Text('Adjective'),
                    ],
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Radio(
                        groupValue: _radioType,
                        value: 'preposition',
                        onChanged: (val) {
                          setState(() {
                            _radioType = val;
                            _radioGender = '';
                            _radioCase = '';
                          });
                        },
                      ),
                      Text('Preposition'),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Radio(
                        groupValue: _radioType,
                        value: 'pronoun',
                        onChanged: (val) {
                          setState(() {
                            _radioType = val;
                            _radioGender = '';
                            _radioCase = '';
                          });
                        },
                      ),
                      Text('Pronoun'),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Radio(
                        groupValue: _radioType,
                        value: 'other',
                        onChanged: (val) {
                          setState(() {
                            _radioType = val;
                            _radioGender = '';
                            _radioCase = '';
                          });
                        },
                      ),
                      Text('Other'),
                    ],
                  ),
                ),
              ]),
              SepLine(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              ),
              _genderSection(_radioType),
              _caseSection(_radioType),
              Underline(' Word: '),
              TextFormField(
                controller: _inputGerman,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                    borderSide: BorderSide(width: 0, color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  hintText: '...German',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some word';
                  }
                  return null;
                },
              ),
              _pluralSection(_radioType),
              TextFormField(
                controller: _inputEnglish,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                    borderSide: BorderSide(width: 0, color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  hintText: '...English',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some word';
                  }
                  return null;
                },
              ),
              SepLine(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              ),
              Underline(' Additional: '),
              TextField(
                controller: _inputAdditional,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                    borderSide: BorderSide(width: 0, color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  hintText: '...Additional information',
                )
              ),
              Text(_radioType),
              Text(_radioGender),
              Text(_radioCase),
              Text(_inputAdditional.text),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 16, 0, 0),
                child: RaisedButton(
                  onPressed: () async {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState.validate()) {
                      var newWord = Word(
                        id: 0,
                        german: _inputGerman.text,
                        plural: _inputPlural.text,
                        english: _inputEnglish.text,
                        type: _radioType,
                        gender: _radioGender,
                        gcase: _radioCase,
                        additional: _inputAdditional.text,
                        level: 0
                      );

                      displayWord(newWord);

                      // Insert a word into the database.
//                      await insertWord(newWord);
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

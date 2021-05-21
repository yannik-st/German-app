import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:german_app/SepLine.dart';
import 'NormalButton.dart';
import 'db_words.dart';
import 'Underline.dart';
import 'DisplayWords.dart';
import 'DisplayConfig.dart';
import 'AmountSlider.dart';

void _something() async {
  print(await rawQuery(
      'SELECT * FROM words WHERE type="noun" AND gender="feminine"'));
}

class ShowWords extends StatefulWidget {
  final String deck;

  ShowWords(this.deck, {Key key}) : super(key: key);

  @override
  _ShowWords createState() => _ShowWords(deck);
}

class _ShowWords extends State<ShowWords> {
  final _formKey = GlobalKey<FormState>();
  final String deck;
  String _radioType = 'any';
  // String _radioHide = 'none';

  _ShowWords(this.deck);

  void _displayWordsPressed(amount, hideDisplay, deck) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DisplayWords(hideDisplay, amount, deck)),
    );
  }

  Widget _configSection(stateProvider) {
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
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: AmountSlider(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                            groupValue: stateProvider.hiddenDisplay,
                            value: 'none',
                            onChanged: (value) => stateProvider.hiddenDisplay = value,
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
                            groupValue: stateProvider.hiddenDisplay,
                            value: 'german',
                            onChanged: (value) => stateProvider.hiddenDisplay = value,
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
                            groupValue: stateProvider.hiddenDisplay,
                            value: 'english',
                            onChanged: (value) => stateProvider.hiddenDisplay = value,
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
    return ChangeNotifierProvider(
      create: (BuildContext context) => DisplayConfig(),
      builder: (context, gel) {
        final stateProvider = Provider.of<DisplayConfig>(context);
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
                  _configSection(stateProvider),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Container(
                      width: 0.5 * MediaQuery.of(context).size.width,
                      height: 0.08 * MediaQuery.of(context).size.height,
                      child: MaterialButton(
                        onPressed: () => _displayWordsPressed(stateProvider.amount, stateProvider.hiddenDisplay, deck),
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
    );
  }
}

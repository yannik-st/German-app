import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NormalButton.dart';
import 'AddWord.dart';
import 'ShowWords.dart';

void _addPressed(BuildContext context, String deck) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddWord(deck)),
  );
}

void _displayPressed(BuildContext context, String deck) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ShowWords(deck)),
  );
}

void _something() {}

class Words extends StatelessWidget {
  final String deck;

  Words(this.deck);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Words',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
        ),
        backgroundColor: Colors.white70,
      ),
      body: Column(children: [
        NormalButton(onPressed: () => _addPressed(context, deck), text: 'Add Word', icon: IconData(57669, fontFamily: 'MaterialIcons')),
        NormalButton(onPressed: _something, text: 'Remove Word', icon: IconData(57691, fontFamily: 'MaterialIcons')),
        NormalButton(onPressed: _something, text: 'Import Words', icon: IconData(57933, fontFamily: 'MaterialIcons')),
        NormalButton(onPressed: () => _displayPressed(context, deck), text: 'Display Words', icon: IconData(57568, fontFamily: 'MaterialIcons')),
        NormalButton(onPressed: _something, text: 'Search Word', icon: IconData(59574, fontFamily: 'MaterialIcons')),
      ]),
    );
  }
}

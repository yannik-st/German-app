import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:german_app/Underline.dart';
import 'package:provider/provider.dart';
import 'DisplayConfig.dart';
import 'db_words.dart';
import 'DisplayedWord.dart';
import 'package:flutter_tts/flutter_tts.dart';

Future<List<Word>> _something(amount) async {
  final List<Word> wordList = await rawQuery('SELECT * FROM words');
  wordList.shuffle();
  List<Word> filteredList = [];
  amount = amount.toInt();
  print(amount);
  if (wordList.length < amount) {
    return wordList;
  } else {
    for (int i = 0; i < amount; i++) {
      filteredList.add(wordList[i]);
    }
    return filteredList;
  }
}

Widget wordListWidget(hide, amount, flutterTts) {
  return FutureBuilder(
    builder: (context, content) {
      if (content.connectionState == ConnectionState.none ||
          content.hasData == false) {
        return Container();
      } else {
        return ListView.builder(
          itemCount: content.data.length,
          itemBuilder: (context, index) {
            Word word = content.data[index];
            return DisplayedWord(
              word: word,
              hidden: hide, // todo: ...
              flutterTts: flutterTts,
            );
          },
        );
      }
    },
    future: _something(amount),
  );
}

class DisplayWords extends StatelessWidget {
  final String hide;
  final double amount;
  final FlutterTts flutterTts = FlutterTts();

  DisplayWords(this.hide, this.amount) {
    flutterTts.setLanguage('de-DE');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DisplayConfig(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Display Words',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
          ),
          backgroundColor: Colors.white70,
        ),
        body: wordListWidget(hide, amount, flutterTts),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:german_app/Underline.dart';
import 'db_words.dart';
import 'DisplayedWord.dart';

Future<List<Word>> _something() async {
  final List<Word> wordList = await rawQuery('SELECT * FROM words');

  return wordList;

  // Convert the List<Map<String, dynamic> into a List<Word>.

//  var list =
//
//  for(int i=0; i<5; i++){
//
//  }
}

Widget wordListWidget() {
  return FutureBuilder(
    builder: (context, content) {
      if (content.connectionState == ConnectionState.none ||
          content.hasData == false) {
        return Container();
      }
      else return ListView.builder(
        itemCount: content.data.length,
        itemBuilder: (context, index) {
          Word word = content.data[index];
          return DisplayedWord(word: word);
        },
      );
    },
    future: _something(),
  );
}

class DisplayWords extends StatelessWidget {
  DisplayWords();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Display Words',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
        ),
        backgroundColor: Colors.white70,
      ),
      body: wordListWidget()
    );
  }
}

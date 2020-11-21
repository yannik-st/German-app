import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:german_app/Underline.dart';
import 'db_words.dart';
import 'DisplayedWord.dart';

Future<List<Word>> _something(amount) async {
  final List<Word> wordList = await rawQuery('SELECT * FROM words');
  wordList.shuffle();
  List<Word> filteredList = [];
  amount = amount.toInt();
  if (wordList.length < amount){
    return wordList;
  }
  else{
    for(int i=0; i<amount; i++){
      filteredList.add(wordList[i]);
    }
    return filteredList;
  }

  // Convert the List<Map<String, dynamic> into a List<Word>.

//  var list =
//
//  for(int i=0; i<5; i++){
//
//  }
}

Widget wordListWidget(amount, hide) {
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
          return DisplayedWord(word: word, hidden: hide,);   // hier noch hide rein? XXX
        },
      );
    },
    future: _something(amount),
  );
}

class DisplayWords extends StatefulWidget {
  final double amount;
  final String hide;

  DisplayWords({Key key, @required this.amount,this.hide}) : super(key: key);

  @override
  _DisplayWords createState() => _DisplayWords(amount, hide);
}

class _DisplayWords extends State<DisplayWords> {
  final double amount;
  final String hide;

  _DisplayWords(this.amount, this.hide);

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
      body: wordListWidget(amount, hide)
    );
  }
}

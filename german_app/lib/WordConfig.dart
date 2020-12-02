import 'package:flutter/foundation.dart';
import 'db_words.dart';

class WordConfig with ChangeNotifier{
  String _hidden = 'none';
  Word _word;
  bool _learned = false;

  String get hidden => _hidden;
  Word get word => _word;

  set hidden(String newVal) {
    _hidden = newVal;
    notifyListeners();
  }
  set word(Word changedWord){
    _word = changedWord;
    notifyListeners();
  }
}
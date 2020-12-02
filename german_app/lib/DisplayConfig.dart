import 'package:flutter/foundation.dart';
import 'db_words.dart';

class DisplayConfig with ChangeNotifier{
  String _hiddenDisplay = 'none';
  double _amount = 15;
  String _type = 'any';
  // Word _word;

  String get hiddenDisplay => _hiddenDisplay;
  double get amount => _amount;
  String get type => _type;
  // Word get word => _word;

  set hiddenDisplay(String newVal) {
    _hiddenDisplay = newVal;
    notifyListeners();
  }
  set amount(double newVal) {
    _amount = newVal;
    notifyListeners();
  }
  set type(String newVal) {
    _type = newVal;
    notifyListeners();
  }
  // set word(Word changedWord){
  //   _word = changedWord;
  //   notifyListeners();
  // }
}
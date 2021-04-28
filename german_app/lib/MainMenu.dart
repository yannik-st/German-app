import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:german_app/Words.dart';
import 'DeckMenu.dart';
import 'Underline.dart';
import 'MenuButton.dart';
import 'Package:german_app/Lectures/LectureMenu.dart';


void wordsPressed(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Words()),
  );
}

void decksPressed(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DeckMenu()),
  );
}

void lecturePressed(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LectureMenu()),
  );
}

class MainMenu extends StatelessWidget {

  MainMenu();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: <Widget>[
          Column(children: [
            Container(
              alignment: Alignment.center,
              margin:
              EdgeInsets.fromLTRB(0.0, 0.07 * MediaQuery
                  .of(context)
                  .size
                  .height, 0.0, 0.0),
              child: MenuButton(onPressed: () => decksPressed(context), text: 'Decks'),
            ),
            Container(
              alignment: Alignment.center,
              margin:
              EdgeInsets.fromLTRB(0.0, 0.07 * MediaQuery
                  .of(context)
                  .size
                  .height, 0.0, 0.0),
              child: MenuButton(onPressed: () => lecturePressed(context), text: 'Lecture'),
            ),
            Container(
              alignment: Alignment.center,
              margin:
              EdgeInsets.fromLTRB(0.0, 0.07 * MediaQuery
                  .of(context)
                  .size
                  .height, 0.0, 0.0),
              child: MenuButton(onPressed: null, text: 'Practice'),
            ),
            Container(
              alignment: Alignment.center,
              margin:
              EdgeInsets.fromLTRB(0.0, 0.07 * MediaQuery
                  .of(context)
                  .size
                  .height, 0.0, 0.0),
              child: MenuButton(onPressed: null, text: 'Game'),
            ),
          ]),
        ]);
  }
}



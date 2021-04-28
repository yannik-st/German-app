import 'package:flutter/material.dart';
import 'db_words.dart';


class DeckMenu extends StatelessWidget {
  DeckMenu();

  final decks = ['deck1', 'deck2', 'deck3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(
        'Decks',
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
    ),
    backgroundColor: Colors.white70,
    ),
    body:  Padding(
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16),
          itemCount: decks.length,
          itemBuilder: (BuildContext ctx, index) {
            return Card(
              color: Colors.deepPurple,
              child: InkWell(
                splashColor: Colors.white,
                onTap: () {
                  print('Card tapped.');
                },
                child: Center(
                  child: Text(decks.elementAt(index),style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            );
          }),
    ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        splashColor: Colors.yellow,
        child: Icon(Icons.add),
        onPressed: () {
          print('THIS BUTTON WILL ADD A NEW DB');
        },
      ),
    );
  }
}
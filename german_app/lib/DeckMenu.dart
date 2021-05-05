import 'package:flutter/material.dart';
import 'db_words.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> _loadDecks() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // if there is no list yet, we initialize it with the lecture deck
  if (prefs.getStringList('decks') == null){
    List<String> list = ['Lecture'];
    prefs.setStringList('decks', list);
    print('first_time');
  }
  List<String> deck_list = prefs.getStringList('decks');

  return deck_list;
}

class DeckMenu extends StatelessWidget {
  DeckMenu();

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
      child: FutureBuilder(
        builder: (context, content) {
          if (content.connectionState == ConnectionState.none ||
              content.hasData == false) {
            return Container();
          } else {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemCount: content.data.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Card(
                    color: Colors.deepPurple,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Center(
                        child: Text(content.data.elementAt(index),style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                  );
                });
          }
        },
          future: _loadDecks(),
      ),
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
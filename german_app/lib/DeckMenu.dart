import 'package:flutter/material.dart';
import 'db_words.dart';
import 'package:shared_preferences/shared_preferences.dart';



class DeckMenu extends StatefulWidget {
  DeckMenu();

  @override
  _DeckMenu createState() => _DeckMenu();
}

class _DeckMenu extends State<DeckMenu> {
  _DeckMenu();

  deckPressed(String deck) {
    print(deck);
  }

  _deletePressedDialog(context, deleteDeck) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete ' + deleteDeck + ' ?'),
          actions: <Widget>[
            Row(children: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () async {
                  // XXX todo: FIRST WE HAVE TO DELETE ALL WORDS IN THE DB WITH deck==deletedDeck otherwise they will be there for ever
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  List<String> list = prefs.getStringList('decks');
                  list.remove(deleteDeck);
                  prefs.setStringList('decks', list);
                  print('deleted: ' + deleteDeck);
                  Navigator.of(context).pop();
                  setState(() {
                  });
                  // XXX todo: refresh Deck Menu
                },
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]),
          ],
        );
      },
    );
  }

  _addDeckDialog(context) {
    String newDeckName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Name the new deck:'),
          content: TextField(
            maxLength: 15,
            onChanged: (value) {
              newDeckName = value;
            },
            decoration: InputDecoration(hintText: "Deck name"),
          ),
          actions: <Widget>[
            Row(children: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () async {
                  if (newDeckName.length > 0) {
                    _addPref(newDeckName);
                    Navigator.of(context).pop();
                    setState(() {
                    });
                    // XXX todo: refresh Deck Menu
                  } else {
                    print('always too short');
                    Navigator.of(context).pop();
                  }
                },
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]),
          ],
        );
      },
    );
  }

  _addPref(String newDeck) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList('decks');
    bool existsAlready = false;
    for (var i = 0; i < list.length; i++) {
      if (newDeck == list.elementAt(i)) {
        existsAlready = true;
      }
    }
    if (existsAlready == false) {
      list.add(newDeck);
    } else {
      print("exists already, ain't adding shit");
    }
    prefs.setStringList('decks', list);
    print('added ' + newDeck);
  }

  Future<List<String>> _loadDecks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // if there is no list yet, we initialize it with the lecture deck
    if (prefs.getStringList('decks') == null) {
      List<String> list = ['Lecture'];
      prefs.setStringList('decks', list);
      print('first_time');
    }
    List<String> deck_list = prefs.getStringList('decks');

    return deck_list;
  }


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
      body: Padding(
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
                          deckPressed(content.data.elementAt(index));
                        },
                        onLongPress: () {
                          _deletePressedDialog(
                              context, content.data.elementAt(index));
                        },
                        // XXX todo: hier soll zuerst so ein kleines fenster aufpopped mit "delete" !!
                        child: Center(
                          child: Text(content.data.elementAt(index),
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
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
          _addDeckDialog(context);
        },
      ),
    );
  }

}
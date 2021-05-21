import 'package:flutter/material.dart';
import 'Words.dart';
import 'db_words.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:german_app/BottomSheetList.dart';


// returns the next empty key in keyList
String _getDeckKey(List<String> keyList){
  String newKey = '';

  for (var i=0; i<keyList.length; i++){
    String checkKey = 'deck'+i.toString();
    bool containsCheckKey = false;

    for (var i=0; i<keyList.length; i++){
      if (checkKey == keyList.elementAt(i)){
        containsCheckKey = true;
      }
    }
    if (containsCheckKey==false){
      newKey = checkKey;
      break;
    }
    else{
      print(checkKey + ' existed already');
    }
  }
  if (newKey == ''){
    newKey = 'deck'+keyList.length.toString();
  }

  return newKey;
}

class DeckMenu extends StatefulWidget {
  DeckMenu();

  @override
  _DeckMenu createState() => _DeckMenu();
}

class _DeckMenu extends State<DeckMenu> {
  List<String> bottomSheetOptions = ['Rename', 'Delete'];
  
  _DeckMenu();

  deckPressed(String deck_name, String deck_key) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Words(deck_key)),
    );
  }
  
  _renamePressedDialog(context, renameDeck) {
    String newDeckName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New name for the deck:'),
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
                    _renamePref(renameDeck, newDeckName);
                    Navigator.of(context).pop();
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
                  List<String> names = prefs.getStringList('deckNames');
                  List<String> keys = prefs.getStringList('deckKeys');
                  int delete_index = 100;
                  for (var i=0; i<names.length; i++){
                    if (deleteDeck == names.elementAt(i)){
                      delete_index = i;
                    }
                  }
                  names.remove(deleteDeck);
                  print('removing key: '+keys.elementAt(delete_index));
                  keys.removeAt(delete_index);
                  prefs.setStringList('deckNames', names);
                  prefs.setStringList('deckKeys', keys);
                  print('deleted: ' + deleteDeck);
                  Navigator.of(context).pop();
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

  _addPref(String newDeckName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> names_list = prefs.getStringList('deckNames');
    List<String> keys_list = prefs.getStringList('deckKeys');
    bool existsAlready = false;
    for (var i = 0; i < names_list.length; i++) {
      if (newDeckName == names_list.elementAt(i)) {
        existsAlready = true;
      }
    }
    if (existsAlready == false) {
      names_list.add(newDeckName);
      String newKey = _getDeckKey(keys_list);
      keys_list.add(newKey);
      prefs.setStringList('deckNames', names_list);
      prefs.setStringList('deckKeys', keys_list);
      print('added ' + newDeckName + 'with key: ' + newKey);
    } else {
      print("exists already, ain't adding shit");
    }
  }

  _renamePref(String deckToRename, newName) async {
    int rename_index = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> names_list = prefs.getStringList('deckNames');
    bool existsAlready = false;
    for (var i = 0; i < names_list.length; i++) {
      if (newName == names_list.elementAt(i)){
        existsAlready = true;
      }
      if (deckToRename == names_list.elementAt(i)) {
        rename_index = i;
      }
    }
    if (existsAlready == false) {
      names_list.removeAt(rename_index);
      names_list.insert(rename_index, newName);
      prefs.setStringList('deckNames', names_list);
      print('renamed ' + deckToRename + 'with key: ' + newName);
    } else {
      print("exists already, ain't adding shit");
    }
  }

  Future<List<List<String>>> _loadDecks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // if there is no list yet, we initialize it with the lecture deck
    if (prefs.getStringList('deckNames') == null || prefs.getStringList('deckNames').isEmpty) {
      List<String> listDeckNames = ['Lecture'];
      List<String> listDeckKeys = ['deck0'];
      prefs.setStringList('deckNames', listDeckNames);
      prefs.setStringList('deckKeys', listDeckKeys);
      print('first_time');
    }
    List<String> names_list = prefs.getStringList('deckNames');
    List<String> keys_list = prefs.getStringList('deckKeys');

    print('names:');
    for(var i=0; i<names_list.length; i++){
      print(names_list.elementAt(i));
    }
    print('keys:');
    for(var i=0; i<keys_list.length; i++){
      print(keys_list.elementAt(i));
    }

    return [names_list, keys_list];
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
              List<String> deckNames = content.data.elementAt(0);
              List<String> deckKeys = content.data.elementAt(1);
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemCount: deckNames.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      color: Colors.deepPurple,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          deckPressed(deckNames.elementAt(index), deckKeys.elementAt(index));
                        },
                        onLongPress: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return BottomSheetList(
                                  optionsList: bottomSheetOptions,
                                  onPressedList: [() => _renamePressedDialog(context, deckNames.elementAt(index)), () => _deletePressedDialog(context, deckNames.elementAt(index))],
                                );
                              }
                          );
                        },
                        child: Center(
                          child: Text(deckNames.elementAt(index),
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
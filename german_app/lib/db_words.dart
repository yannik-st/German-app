import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Word{
  final int id;
  final String german;
  final String plural;
  final String english;
  final String type;
  final String gender;
  final String gcase;
  final String additional;
  final int level;

  Word({this.id, this.german, this.plural, this.english, this.type, this.gender, this.gcase, this.additional, this.level});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'german': german,
      'plural': plural,
      'english': english,
      'type': type,
      'gender': gender,
      'gcase': gcase,
      'additional': additional,
      'level': level
    };
  }

  // Implement toString to make it easier to see information about
  // each word when using the print statement.
  @override
  String toString() {
    return 'Word{id: $id, german: $german, english: $english, type: $type, gender: $gender, gcase: $gcase, additional: $additional, level: $level}';
  }
}

initDB() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'word_base.db'),
    // When the database is first created, create a table to store words.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE words(id INTEGER, german TEXT PRIMARY KEY, plural TEXT, english TEXT, type TEXT, gender TEXT, gcase TEXT, additional TEXT, level INTEGER)", //todo: "PRIMARY KEY" for id only makes sense if we also use it for searching!! XXX
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  return database;
}

var database = initDB();

Future<void> insertWord(Word word) async {
  // Get a reference to the database.
  final Database db = await database;

  // Insert the Word into the correct table. Also specify the
  // `conflictAlgorithm`. In this case, if the same word is inserted
  // multiple times, it replaces the previous data.
  await db.insert(
    'words',
    word.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Word>> words() async {
  // Get a reference to the database.
  final Database db = await database;

  // Query the table for all The Words.
  final List<Map<String, dynamic>> maps = await db.query('words');

  // Convert the List<Map<String, dynamic> into a List<Word>.
  return List.generate(maps.length, (i) {
    return Word(
      id: maps[i]['id'],
      german: maps[i]['german'],
      plural: maps[i]['plural'],
      english: maps[i]['english'],
      type: maps[i]['type'],
      gender: maps[i]['gender'],
      gcase: maps[i]['gcase'],
      additional: maps[i]['additional'],
      level: maps[i]['level']
    );
  });
}

Future<List<Word>> rawQuery(String query) async {
  // Get a reference to the database.
  final Database db = await database;

  // Query the table for all The Words.
  final List<Map<String, dynamic>> maps = await db.rawQuery(query);

  // Convert the List<Map<String, dynamic> into a List<Word>.
  return List.generate(maps.length, (i) {
    return Word(
        id: maps[i]['id'],
        german: maps[i]['german'],
        plural: maps[i]['plural'],
        english: maps[i]['english'],
        type: maps[i]['type'],
        gender: maps[i]['gender'],
        gcase: maps[i]['gcase'],
        additional: maps[i]['additional'],
        level: maps[i]['level']
    );
  });
}

Future<List<Word>> queryType(String type) async {
  // Get a reference to the database.
  final Database db = await database;

  // Query the table for all The Words.
  final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT "english" FROM "words"');

  // Convert the List<Map<String, dynamic> into a List<Word>.
  return List.generate(maps.length, (i) {
    return Word(
        id: maps[i]['id'],
        german: maps[i]['german'],
        plural: maps[i]['plural'],
        english: maps[i]['english'],
        type: maps[i]['type'],
        gender: maps[i]['gender'],
        gcase: maps[i]['gcase'],
        additional: maps[i]['additional'],
        level: maps[i]['level']
    );
  });
}

Future<void> updateWord(Word word) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Word.
  await db.update(
    'words',
    word.toMap(),
    // Ensure that the Word has a matching id.
    where: "german = ?",
    // Pass the Word's id as a whereArg to prevent SQL injection.
    whereArgs: [word.german],
  );
}

Future<void> deleteWord(String german) async {  //todo: delete by 'german' might not make sense, maybe work with id!!!!!!!! XXX
  // Get a reference to the database.
  final db = await database;

  // Remove the Word from the database.
  await db.delete(
    'words',
    // Use a `where` clause to delete a specific word.
    where: "german = ?",
    // Pass the Word's id as a whereArg to prevent SQL injection.
    whereArgs: [german],
  );
}
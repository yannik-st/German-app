import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:german_app/NormalButton.dart';
import 'LectureManager.dart';
import 'package:german_app/Lectures/L1/L1.dart' as L1;
import 'package:german_app/Lectures/L2/L2.dart' as L2;

void _lecture1Pressed(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LectureManager(pages: L1.pages)),
  );
}

void _lecture2Pressed(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LectureManager(pages: L2.pages)),
  );
}

void _something() {}

class LectureMenu extends StatelessWidget {
  LectureMenu();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lectures',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
        ),
        backgroundColor: Colors.white70,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          NormalButton(onPressed: () => _lecture1Pressed(context), text: 'Lecture 1', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _lecture2Pressed(context), text: 'Lecture 2', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 3', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 4', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 5', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 6', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 7', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 8', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 9', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 10', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 11', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 12', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 13', icon: IconData(59816, fontFamily: 'MaterialIcons')),
          NormalButton(onPressed: () => _something, text: 'Lecture 14', icon: IconData(59816, fontFamily: 'MaterialIcons')),
        ],
      ),
    );
  }
}
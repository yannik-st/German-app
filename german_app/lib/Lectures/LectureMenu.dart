import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:german_app/NormalButton.dart';
import '../LectureButton.dart';
import 'LectureManager.dart';
import 'package:german_app/Lectures/L1/L1.dart' as L1;
import 'package:german_app/Lectures/L2/L2.dart' as L2;

void _lecture1Pressed(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LectureManager(pages: L1.pages, lectureNumber: '1',)),
  );
}

void _lecture2Pressed(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LectureManager(pages: L2.pages, lectureNumber: '2',)),
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
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
        children: <Widget>[
          LectureButton(onPressed: () => _lecture1Pressed(context), title: 'Lecture 1', text: 'nouns - article, plural'),
          LectureButton(onPressed: () => _lecture2Pressed(context), title: 'Lecture 2', text: 'something'),
          LectureButton(onPressed: () => _something, title: 'Lecture 3', text: 'something'),
          LectureButton(onPressed: () => _something, title: 'Lecture 4', text: 'something'),
          LectureButton(onPressed: () => _something, title: 'Lecture 5', text: 'something'),
          LectureButton(onPressed: () => _something, title: 'Lecture 6', text: 'something'),
          LectureButton(onPressed: () => _something, title: 'Lecture 7', text: 'something'),
          LectureButton(onPressed: () => _something, title: 'Lecture 8', text: 'something'),
        ],
      ),
    );
  }
}
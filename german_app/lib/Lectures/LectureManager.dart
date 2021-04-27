import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:german_app/Lectures/LectureMenu.dart';

import 'dart:math';

class LectureManager extends StatefulWidget {
  final List pages; // pages is a list filled with the respective lecture pages
  final String lectureNumber;

  LectureManager({Key key, @required this.pages, @required this.lectureNumber}) : super(key: key);

  @override
  _LectureManager createState() => _LectureManager();
}

class _LectureManager extends State<LectureManager> {
  List pages;
  String lectureNumber;

  int _selectedIndex = 0;

  _LectureManager();

  @override
  void initState(){
    super.initState();
    pages = widget.pages;
    lectureNumber = widget.lectureNumber;
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0){
        _selectedIndex = max(_selectedIndex-1, 0);
      }
      else if (index == 1){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LectureMenu()),
          );
      }
      else if (index == 2){
        _selectedIndex = min(_selectedIndex+1, pages.length-1);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lecture ' + lectureNumber,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
        ),
        backgroundColor: Colors.white70,
      ),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_left,
              color: Colors.deepPurple,
              size: 40,
            ),
            title: Padding(padding: EdgeInsets.all(0)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.deepPurple,
            ),
            title: Padding(padding: EdgeInsets.all(0)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_right,
              color: Colors.deepPurple,
              size: 40,
            ),
            title: Padding(padding: EdgeInsets.all(0)),
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
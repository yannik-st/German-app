import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class L1P1 extends StatelessWidget {
  L1P1();

  final String t1 = '''Hello there! It's time for our first lecture!
By the way, this app will teach you german in a slowly but steady manner and is not your typical "learn german in 30 days" app. 
However, I think if you study on a regularly basis you can pick up fairly fast :)''';

  final String t2 = '''Look over to page two''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lecture 1',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
        ),
        backgroundColor: Colors.white70,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          ),
          Text(
            'Some Basics',
            style: TextStyle(fontSize: 30),
          ),
          SelectableText(
            t1,
            style: TextStyle(fontSize: 22),
          ),
          Text(
            t2,
            style: TextStyle(fontSize: 22),
          ),
        ]),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => L1P2()))
      //   },
      // ),
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
        onTap: (context) => {},
      ),
    );
  }
}

class L1P2 extends StatelessWidget {
  L1P2();

  final String t1 = '''Text on second Page''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lecture 1',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
        ),
        backgroundColor: Colors.white70,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          ),
          Text(
            'Types of words',
            style: TextStyle(fontSize: 30),
          ),
          SelectableText(
            t1,
            style: TextStyle(fontSize: 22),
          ),
        ]),
      ),
    );
  }
}

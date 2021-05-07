import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:german_app/NormalButton.dart';

class BottomSheetList extends StatelessWidget {
  final List<String> optionsList;
  final List<GestureTapCallback> onPressedList;

  BottomSheetList({@required this.optionsList, @required this.onPressedList});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        // height: 0.15 * MediaQuery.of(context).size.height,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: optionsList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 1 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(15),
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  child: RawMaterialButton(
                    // fillColor: Colors.orange[150],
                    splashColor: Colors.white,
                    onPressed: onPressedList.elementAt(index),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Text(optionsList.elementAt(index)),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

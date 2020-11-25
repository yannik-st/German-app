import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DisplayConfig.dart';

class AmountSlider extends StatelessWidget {
  AmountSlider();

  @override
  Widget build(BuildContext context) {
    final stateProvider = Provider.of<DisplayConfig>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        ' Amount:  ${stateProvider.amount}',
        style: TextStyle(fontSize: 18),
      ),
      Container(
        width: 4.5 / 8 * MediaQuery.of(context).size.width,
        //alignment: Alignment.centerLeft,
        child: Slider(
            value: stateProvider.amount,
            min: 5,
            max: 50,
            divisions: 9,
            onChanged: (value) => stateProvider.amount = value),
      ),
    ]);
  }
}

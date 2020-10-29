import 'package:flutter/material.dart';

const activeCardColor = Color(0XFF1D1F33);
const inactiveCardColor = Color(0XFF111328);

class BMICardBox extends StatelessWidget {
  BMICardBox({this.child, this.isSelected = false});

  final Widget child;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? activeCardColor : inactiveCardColor,
        ),
      ),
    );
  }
}

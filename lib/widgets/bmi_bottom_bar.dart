import 'package:flutter/material.dart';

const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;

class BMIBottomBar extends StatelessWidget {
  final String label;
  final Null Function() onPress;

  const BMIBottomBar({@required this.label, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        color: bottomContainerColor,
        height: bottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

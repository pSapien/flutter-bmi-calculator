import 'package:flutter/material.dart';

class BMICounterLabel extends StatelessWidget {
  final String label;
  final int value;
  final Function onIncrement;
  final Function onDecrement;

  BMICounterLabel({this.label, this.value, this.onIncrement, this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

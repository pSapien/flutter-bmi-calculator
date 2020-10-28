import 'package:flutter/material.dart';

class BMIInputPage extends StatefulWidget {
  BMIInputPage({Key key}) : super(key: key);

  @override
  _BMIInputPageState createState() => _BMIInputPageState();
}

class _BMIInputPageState extends State<BMIInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}

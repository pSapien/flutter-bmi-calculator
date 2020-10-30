import 'package:flutter/material.dart';
import 'pages/bmi_input_page.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

/**
 * design link -> https://dribbble.com/shots/4585382-Simple-BMI-Calculator
 */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0D22),
      ),
      home: BMIInputPage(),
    );
  }
}

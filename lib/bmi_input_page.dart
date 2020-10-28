import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;
const appBarTitle = 'BMI Calculator';

class BMIInputPage extends StatefulWidget {
  BMIInputPage({Key key}) : super(key: key);

  @override
  _BMIInputPageState createState() => _BMIInputPageState();
}

class _BMIInputPageState extends State<BMIInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICardBox(
                    child: ColumnIconLabel(
                      label: "male",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: BMICardBox(
                    child: ColumnIconLabel(
                      label: "female",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: BMICardBox(),
          ),
          Expanded(
            child: BMICardBox(),
          ),
          Container(
            color: bottomContainerColor,
            height: bottomContainerHeight,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

class ColumnIconLabel extends StatelessWidget {
  ColumnIconLabel({@required this.label, @required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        SizedBox(height: 15.0),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}

const activeCardColor = Color(0XFF1D1F33);

class BMICardBox extends StatelessWidget {
  BMICardBox({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: activeCardColor,
      ),
    );
  }
}

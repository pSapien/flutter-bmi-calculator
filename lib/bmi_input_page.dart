import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './widgets/bmi_card_box.dart';
import './widgets/column_icon_label.dart';
import './bmi_calculator.dart';

const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;
const appBarTitle = 'BMI Calculator';

class BMIInputPage extends StatefulWidget {
  BMIInputPage({Key key}) : super(key: key);

  @override
  _BMIInputPageState createState() => _BMIInputPageState();
}

class _BMIInputPageState extends State<BMIInputPage> {
  final bmiCalculator = BMICalculator();

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
                  child: GestureDetector(
                    onTap: () => setState(() => bmiCalculator.setMale()),
                    child: BMICardBox(
                      isSelected: bmiCalculator.isMale(),
                      child: ColumnIconLabel(
                        label: BMICalculator.male,
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => bmiCalculator.setFemale()),
                    child: BMICardBox(
                      isSelected: bmiCalculator.isFemale(),
                      child: ColumnIconLabel(
                        label: BMICalculator.female,
                        icon: FontAwesomeIcons.venus,
                      ),
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

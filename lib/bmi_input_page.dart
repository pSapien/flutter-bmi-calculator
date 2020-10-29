import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './widgets/bmi_card_box.dart';
import './widgets/column_icon_label.dart';
import './bmi_calculator.dart';

const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;
const appBarTitle = 'BMI Calculator';
const valueStyle = TextStyle(
  fontSize: 48.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
const labelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);
const gapBetweenSizeAndValue = 10.0;

// 89

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
                GestureDetector(
                  onTap: () => setState(bmiCalculator.setMale),
                  child: BMICardBox(
                    isSelected: bmiCalculator.isMale(),
                    child: ColumnIconLabel(
                      label: BMICalculator.male,
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(bmiCalculator.setFemale),
                  child: BMICardBox(
                    isSelected: bmiCalculator.isFemale(),
                    child: ColumnIconLabel(
                      label: BMICalculator.female,
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                )
              ],
            ),
          ),
          BMICardBox(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: labelStyle),
                  SizedBox(height: gapBetweenSizeAndValue),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        bmiCalculator.getHeight().round().toString(),
                        style: valueStyle,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: bottomContainerColor,
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      value: bmiCalculator.getHeight(),
                      min: bmiCalculator.getMinHeight(),
                      max: bmiCalculator.getMaxHeight(),
                      label: bmiCalculator.getHeight().round().toString(),
                      onChanged: (double value) =>
                          setState(() => bmiCalculator.setHeight(value)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                BMICardBox(
                  child: null,
                ),
                BMICardBox(
                  child: null,
                ),
              ],
            ),
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

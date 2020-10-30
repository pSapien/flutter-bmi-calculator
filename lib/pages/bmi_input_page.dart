import 'package:bmi/widgets/bmi_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/bmi_card_box.dart';
import '../widgets/column_icon_label.dart';
import '../models/bmi_calculator.dart';
import 'bmi_results_page.dart';

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
                    onTap: () => setState(bmiCalculator.setMale),
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
                    onTap: () => setState(bmiCalculator.setFemale),
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
            child: BMICardBox(
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
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: LabelValueCounter(
                    label: 'WEIGHT',
                    value: bmiCalculator.getWeight(),
                    onSet: (v) => setState(() => bmiCalculator.setWeight(v)),
                  ),
                ),
                Expanded(
                  child: LabelValueCounter(
                    label: 'AGE',
                    value: bmiCalculator.getAge(),
                    onSet: (v) => setState(() => bmiCalculator.setAge(v)),
                  ),
                ),
              ],
            ),
          ),
          BMIBottomBar(
            label: 'CALCULATE YOUR BMI',
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  final result = bmiCalculator.calculate();
                  print(result);

                  return BMIResultsPage(
                    bmi: result['bmi'],
                    status: result['status'],
                  );
                }),
              );
            },
          )
        ],
      ),
    );
  }
}

class LabelValueCounter extends StatelessWidget {
  final String label;
  final int value;
  final Function onSet;

  const LabelValueCounter({
    this.label,
    this.value,
    this.onSet,
  });

  _buildCircle(icon) {
    final dimension = 60.0;

    return Container(
      child: Icon(icon, color: Colors.white, size: dimension / 1.5),
      height: dimension,
      width: dimension,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(dimension / 2),
        color: Color(0xFF1C1F32),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BMICardBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          SizedBox(height: gapBetweenSizeAndValue),
          Text(value.toString(), style: valueStyle),
          SizedBox(height: gapBetweenSizeAndValue),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: _buildCircle(Icons.remove),
                  onTap: () => onSet(value - 1),
                ),
                InkWell(
                  child: _buildCircle(Icons.add),
                  onTap: () => onSet(value + 1),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

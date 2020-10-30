import 'package:bmi/widgets/bmi_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:bmi/widgets/bmi_card_box.dart';

class BMIResultsPage extends StatelessWidget {
  final String bmi;
  final String status;

  const BMIResultsPage({this.bmi, this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(30.0),
              child: BMICardBox(
                child: Container(
                  padding: EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        status.toUpperCase(),
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        bmi,
                        style: TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          'Normal BMI range:',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF545665),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          '18.5 - 25 kg/m2',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BMIBottomBar(
            label: 'RECALCULATE YOUR BMI',
            onPress: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

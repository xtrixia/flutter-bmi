import 'package:flutter/material.dart';

import '../components/footer.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiCalculation,
      @required this.bmiInterpret,
      @required this.bmiResult});

  final String bmiResult;
  final String bmiInterpret;
  final String bmiCalculation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReusableCard(
                colour: kCardInactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiResult,
                      style: kLabelSubheadingStyle,
                    ),
                    Text(
                      bmiCalculation,
                      style: kLabelHeadingStyle,
                    ),
                    Text(
                      bmiInterpret,
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,
                    )
                  ],
                )),
          ),
          Footer(
            label: "Re-Calculate",
            onClick: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/footer.dart';
import '../components/icon_content_card.dart';
import '../components/icon_round_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int userHeight = 180;
  int userWeight = 50;
  int userAge = 23;

  void handleGenderClicked(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void handleHeightSlided(double height) {
    setState(() {
      userHeight = height.round();
    });
  }

  void handleWeightClicked(Weight weight) {
    if (weight == Weight.plus)
      userWeight++;
    else
      userWeight--;
  }

  void handleAgeClicked(Age age) {
    if (age == Age.plus)
      userAge++;
    else
      userAge--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onCardPress: () {
                      handleGenderClicked(Gender.female);
                      print("Male button pressed.");
                    },
                    colour: selectedGender == Gender.male
                        ? kCardActiveColor
                        : kCardInactiveColor,
                    cardChild: IconContentCard(
                      icon: FontAwesomeIcons.mars,
                      label: "Male",
                      colour: selectedGender == Gender.male
                          ? kTextInactiveColor
                          : kTextColor,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onCardPress: () {
                      handleGenderClicked(Gender.male);
                      print("Female button pressed.");
                    },
                    colour: selectedGender == Gender.female
                        ? kCardActiveColor
                        : kCardInactiveColor,
                    cardChild: IconContentCard(
                      icon: FontAwesomeIcons.venus,
                      label: "Female",
                      colour: selectedGender == Gender.female
                          ? kTextInactiveColor
                          : kTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kCardInactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        userHeight.toString(),
                        style: kLabelHighlightTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 10,
                      thumbColor: kContainerBottomColor,
                      inactiveTrackColor: kTextInactiveColor,
                      activeTrackColor: kTextColor,
                      overlayColor: kOverlaySliderColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 32),
                    ),
                    child: Slider(
                      min: MIN_HEIGHT.toDouble(),
                      max: MAX_HEIGHT.toDouble(),
                      value: userHeight.toDouble(),
                      onChanged: (double height) {
                        handleHeightSlided(height);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kCardInactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          userWeight.toString(),
                          style: kLabelHighlightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onClick: () {
                                setState(() {
                                  handleWeightClicked(Weight.minus);
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onClick: () {
                                setState(() {
                                  handleWeightClicked(Weight.plus);
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kCardInactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          userAge.toString(),
                          style: kLabelHighlightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onClick: () {
                                setState(() {
                                  handleAgeClicked(Age.minus);
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onClick: () {
                                setState(() {
                                  handleAgeClicked(Age.plus);
                                });
                              },
                            ),
                            // FloatingActionButton(
                            //   backgroundColor: kTextInactiveColor,
                            //   onPressed: () => print("Age+"),
                            //   child: Icon(
                            //     FontAwesomeIcons.plus,
                            //   ),
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Footer(
            label: "Calculate",
            onClick: () {
              Calculator calculatorBrain =
                  Calculator(weight: userWeight, height: userHeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiCalculation: calculatorBrain.calculateBMI(),
                    bmiInterpret: calculatorBrain.getInterpretation(),
                    bmiResult: calculatorBrain.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

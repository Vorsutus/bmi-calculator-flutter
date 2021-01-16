import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/roundIcon_button.dart';
import 'package:bmi_calculator/calculated_brain.dart';
import '../screens/results_page.dart';

var male = false;
var female = false;

//enum instead of using 1 and 2, useful for more than one property and readability
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 55;
  int weight = 125;
  int age = 25;
  //making mutable/changeable variable
//  Color maleCardColor = inactiveCardColour;
//  Color femaleCardColor = inactiveCardColour;

  //passing 1 for male and 2 for female
//  void updateColour(Gender myGender) {
//    //1 passed in for male
//    if (myGender == Gender.male) {
//      if (maleCardColor == inactiveCardColour) {
//        print('changing Male to active color.');
//        maleCardColor = activeCardColour;
//        femaleCardColor = inactiveCardColour;
//      } else {
//        maleCardColor = inactiveCardColour;
//      }
//    }
//    //2 passed in for female
//    if (myGender == Gender.female) {
//      if (femaleCardColor == inactiveCardColour) {
//        print('changing Female to active color.');
//        femaleCardColor = activeCardColour;
//        maleCardColor = inactiveCardColour;
//      } else {
//        femaleCardColor = inactiveCardColour;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    //takes care of the styling
                    //colour: maleCardColor,
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardColumn(
                      //takes care of the card content
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    //anonymous function we pass into ReusableCard class
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    //colour: femaleCardColor,
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardColumn(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    //anonymous function we pass into ReusableCard class
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'in',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    //this modified slider theme could be put in main.dart if needed for multiple cards
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 40,
                      max: 90,
                      //activeColor: Colors.white, moved to the SliderTheme data
                      //inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'lbs',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),

                        //This method of building the buttons won't work well because documentation says that it isn't a good idea to have more than 1 floating action button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
//                            FloatingActionButton(
//                              backgroundColor: Color(0xFF4C4F5E),
//                              child: Icon(
//                                Icons.remove,
//                                color: Colors.white,
//                              ),
//                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                  print('wights = $weight');
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
//                            FloatingActionButton(
//                              backgroundColor: Color(0xFF4C4F5E),
//                              child: Icon(
//                                Icons.add,
//                                color: Colors.white,
//                              ),
//                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                  print('wights = $weight');
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'yo',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),

                        //This method of building the buttons won't work well because documentation says that it isn't a good idea to have more than 1 floating action button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              //passing our height and wight to the calculator
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
// => shorthand for single line in the function body {return ResultsPage()}
                  builder: (context) => ResultsPage(
                    //strings from calculated brain and passed to the ResultsPage()
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
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

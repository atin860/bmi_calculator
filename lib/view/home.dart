import 'package:bmi_calc/calcbran.dart/brane.dart';
import 'package:bmi_calc/view/results.dart';
import 'package:bmi_calc/widget/bottombutton.dart';
import 'package:bmi_calc/widget/constant.dart';
import 'package:bmi_calc/widget/container.dart';
import 'package:bmi_calc/widget/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? seleSctedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  // Color MaleCardColors = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  //1=male , 2=femal
//   void updateColor(Gender selectedGender) {
//     //male card tap
//     if (selectedGender == Gender.male) {
//       if (MaleCardColors == inactiveCardColor) {
//         MaleCardColors = activeCardColour;
//         femaleCardColor = inactiveCardColor;
//       } else {
//         MaleCardColors = inactiveCardColor;
//       }
//     }
//     //female card tap
//     if (selectedGender == Gender.female) {
//       if (femaleCardColor == inactiveCardColor) {
//         femaleCardColor = activeCardColour;
//         MaleCardColors = inactiveCardColor;
//       } else {
//         femaleCardColor = inactiveCardColor;
//       }
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 2, 3, 6),
          title: Center(
            child: Text(
              "BMI CALCULATOR",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seleSctedGender = Gender.male;
                      });
                    },
                    child: MyContainer(
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          text: "Male",
                        ),
                        color: seleSctedGender == Gender.male
                            ? kActiveCardColour
                            : kInactiveCardColor),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seleSctedGender = Gender.female;
                      });
                    },
                    child: MyContainer(
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          text: "FEMALE",
                        ),
                        color: seleSctedGender == Gender.female
                            ? kActiveCardColour
                            : kInactiveCardColor),
                  )),
                ],
              ),
            ),
            Expanded(
                child: MyContainer(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
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
                              "cm",
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Color(0xFF8D8E98),
                                thumbColor: Color(0xFFEB1555),
                                activeTrackColor: Colors.white,
                                overlayColor: Color(0x29EB1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0)),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220,
                              activeColor: Color(0xFFEB1555),
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            )),
                      ],
                    ),
                    color: kActiveCardColour)),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: MyContainer(
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("WEIGHT", style: kLabelTextStyle),
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    RoundIconButton(
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      icon: FontAwesomeIcons.plus,
                                    )
                                  ])
                            ],
                          ),
                          color: kActiveCardColour)),
                  Expanded(
                    child: MyContainer(
                      color: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE", style: kLabelTextStyle),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                )
                              ])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(height, weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              bmiResult: calc.calculatorBMI(),
                              resultText: calc.getResult(),
                              interPretation: calc.getInterPretation(),
                            )));
              },
              title: "CALCULATE",
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

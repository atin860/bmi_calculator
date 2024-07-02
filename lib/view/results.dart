import 'package:bmi_calc/widget/bottombutton.dart';
import 'package:bmi_calc/widget/constant.dart';
import 'package:bmi_calc/widget/container.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interPretation});
  final String bmiResult;
  final String resultText;
  final String interPretation;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          // backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            )),
            Expanded(
              flex: 5,
              child: MyContainer(
                color: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.resultText,
                      style: kResultTextStyle,
                    ),
                    Text(
                      widget.bmiResult,
                      style: kBmiTextStyle,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      widget.interPretation,
                      style: kBodyStyle,
                    ),
                    BottomButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: "Re-CALCULATE",
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

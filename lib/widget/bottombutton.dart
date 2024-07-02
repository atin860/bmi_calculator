import 'package:bmi_calc/widget/constant.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.onTap,
    required this.title,
  });
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Center(child: Text(title, style: kLargeButtonStyle)),
        color: kBottomContainerColor,
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: kBottomC0ntainerHeight,
      ),
    );
  }
}

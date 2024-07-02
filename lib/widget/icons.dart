import 'package:bmi_calc/widget/constant.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Color(0xFF8D8E98),
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(text, style: kLabelTextStyle)
      ],
    );
  }
}

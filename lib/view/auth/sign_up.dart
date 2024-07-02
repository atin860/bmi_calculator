import 'package:bmi_calc/widget/app_button.dart';
import 'package:bmi_calc/widget/bottombutton.dart';
import 'package:bmi_calc/widget/textfield.dart';
import 'package:flutter/material.dart';

class SIgnUpScreen extends StatefulWidget {
  const SIgnUpScreen({super.key});

  @override
  State<SIgnUpScreen> createState() => _SIgnUpScreenState();
}

class _SIgnUpScreenState extends State<SIgnUpScreen> {
  TextEditingController Email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTextField(
            controller: Email,
            label: "Email",
          ),
          MyTextField(
            controller: password,
            label: "password",
          ),
          SizedBox(
            height: 50,
          ),
          AppButton(title: "Send", onPressed: () {})
        ],
      ),
    );
  }
}

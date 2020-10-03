import 'package:flutter/material.dart';
import 'package:monstr_app/design/input_checkbox.dart';

class SurvivalPage extends StatefulWidget {
  @override
  _SurvivalPageState createState() => _SurvivalPageState();
}

class _SurvivalPageState extends State<SurvivalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InputCheckbox(
            text: "Am I streaming?"
          ),
          InputCheckbox(
            text: "Am I streaming?"
          ),
          InputCheckbox(
            text: "Am I streaming?"
          ),
        ],
      ),
    );
  }
}
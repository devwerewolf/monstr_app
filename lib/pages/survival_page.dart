import 'package:flutter/material.dart';
import 'package:monstr_app/components/blood_group.dart';

class SurvivalPage extends StatefulWidget {
  
  
  @override
  _SurvivalPageState createState() => _SurvivalPageState();
}

class _SurvivalPageState extends State<SurvivalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.orange),
        child: Column(
          children: [
            BloodGroup(),
          ],
        )
      ),
    );
  }
}
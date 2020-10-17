import 'package:flutter/material.dart';
import 'package:monstr_app/components/blood_group.dart';

class SurvivalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.orange),
        child: Column(
          children: [
            BloodGroup(),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:monstr_app/models/blood.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BloodStats extends StatefulWidget {
  final Blood blood;
  
  BloodStats(this.blood);
  
  @override
  _BloodStatsState createState() => _BloodStatsState();
}

class _BloodStatsState extends State<BloodStats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.blood.type
        ),
        LinearPercentIndicator(
          width: 150,
          lineHeight: 20,
          progressColor: Colors.red,
          percent: widget.blood.percentageAmount,
          alignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:monstr_app/models/blood.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BloodStats extends StatefulWidget {
  final Blood blood;
  
  BloodStats({@required this.blood});
  
  @override
  _BloodStatsState createState() => _BloodStatsState();
}

class _BloodStatsState extends State<BloodStats> {
  @override
  Widget build(BuildContext context) {
    Blood bloodProp = widget.blood;
    
    return LinearPercentIndicator(
      width: 150,
      lineHeight: 20,
      progressColor: Colors.red,
      percent: bloodProp.currentAmount / bloodProp.maxAmount,
    );
  }
}
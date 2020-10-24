import 'package:flutter/material.dart';
import 'package:monstr_app/constants/custom_theme.dart';
import 'package:monstr_app/design/title_text.dart';
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
        // TitleText(text: widget.blood.type,),
        Text(
          widget.blood.type,
          style: TextStyle(
            color: HomePageTextColor,
            fontSize: 40,
          ),
          textAlign: TextAlign.center, 
        ),
        LinearPercentIndicator(
          width: 150,
          lineHeight: 20,
          progressColor: Colors.orange,
          backgroundColor: Colors.grey[700],
          percent: widget.blood.percentageAmount,
          alignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}
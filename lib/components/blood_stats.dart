import 'package:flutter/material.dart';
import 'package:monstr_app/constants/custom_theme.dart';
import 'package:monstr_app/design/panel.dart';
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TitleText(text: widget.blood.type,),
          Text(
            widget.blood.type,
            style: TextStyle(
              color: HomePageTextColor,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          LinearPercentIndicator(
            width: 150,
            lineHeight: 20,
            progressColor: SurvivalPageBorderColor,
            backgroundColor: Colors.grey[600],
            percent: widget.blood.percentageAmount,
            alignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
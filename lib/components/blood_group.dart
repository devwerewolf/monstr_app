import 'package:flutter/material.dart';
import 'package:monstr_app/components/blood_stats.dart';
import 'package:monstr_app/constants/custom_theme.dart';
import 'package:monstr_app/utils/blood_list_utils.dart';

class BloodGroup extends StatefulWidget {
  @override
  _BloodGroupState createState() => _BloodGroupState();
}

class _BloodGroupState extends State<BloodGroup> {
  @override
  Widget build(BuildContext context) {
    return BloodListRender(
      render: (bloodList) {
        var chosenBloodList = bloodList.where((blood) => blood.chosen);
        var bloodStatsList = chosenBloodList.map((chosenBlood) => BloodStats(chosenBlood));
        
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Text(
                "Blood",
                style: TextStyle(
                  color: HomePageTextColor,
                  fontSize: 30,
                  decoration: TextDecoration.underline
                ),
              ),
            ),
            ...bloodStatsList
          ],
        );
      },
    );
  }
}
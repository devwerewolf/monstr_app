import 'package:flutter/material.dart';
import 'package:monstr_app/utils/blood_list_utils.dart';

class BloodGroup extends StatefulWidget {
  @override
  _BloodGroupState createState() => _BloodGroupState();
}

class _BloodGroupState extends State<BloodGroup> {
  @override
  Widget build(BuildContext context) {
    var bloodStatsList = fetchBloodStatsList(context);
    
    return Column(
      children: [
        Text(
          "Blood"
        ),
        ...bloodStatsList,
      ],
    );
  }
}
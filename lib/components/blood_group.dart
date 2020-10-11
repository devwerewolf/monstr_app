import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/components/blood_stats.dart';
import 'package:monstr_app/data/blood_list.dart';
// import 'package:monstr_app/design/checkbox_input.dart';
// import 'package:monstr_app/design/panel_list.dart';
// import 'package:monstr_app/models/blood.dart';

class BloodGroup extends StatefulWidget {
  @override
  _BloodGroupState createState() => _BloodGroupState();
}

class _BloodGroupState extends State<BloodGroup> {
  bool _edit = false;
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BloodListBloc, BloodListState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadSuccessState:
            var bloodList = (state as LoadSuccessState).bloodList;
            var chosenBloodList = bloodList.where((blood) => blood.chosen).toList();
            var bloodStatsList = chosenBloodList.map((bloodElement) => BloodStats(blood: bloodElement)).toList();
            
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
    );
  }
}
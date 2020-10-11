import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/data/blood_list.dart';
import 'package:monstr_app/design/checkbox_input.dart';
import 'package:monstr_app/design/full_size_container.dart';
import 'package:monstr_app/models/blood.dart';
import 'package:monstr_app/components/blood_stats.dart';

class SurvivalPage extends StatefulWidget {
  @override
  _SurvivalPageState createState() => _SurvivalPageState();
}

class _SurvivalPageState extends State<SurvivalPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: Implement a `FilteredBloodList` bloc for scalability
    
    return BlocBuilder<BloodListBloc, BloodListState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadSuccessState:
            var bloodList = (state as LoadSuccessState).bloodList;
            var chosenBloodList = bloodList.where((blood) => blood.chosen).toList();
            var bloodStatsList = chosenBloodList.map((bloodElement) => BloodStats(blood: bloodElement)).toList();
        
            return Scaffold(
              body: Container(
                decoration: BoxDecoration(color: Colors.orange),
                child: Column(
                  children: [
                    Text(
                      "Blood"
                    ),
                    ...bloodStatsList,
                  ],
                ),
              ),
            );
          default:
            return Container(
              child: Text(
                "Hello?"
              ),
            );
        }
      },
    );
  }
}
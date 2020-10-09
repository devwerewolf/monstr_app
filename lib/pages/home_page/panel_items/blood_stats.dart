import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/data/blood_list.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BloodStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BloodListBloc, BloodListState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadSuccessState:
            var bloodList = (state as LoadSuccessState).bloodList;
            var chosenBloodList = bloodList.where((blood) => blood.chosen);
            var chosenBloodListLength = chosenBloodList.length.toString();
            
            return Container(
              // child: Text(
              //   chosenBloodListLength
              // ),
              child: LinearPercentIndicator(
                width: 150,
                lineHeight: 20,
                progressColor: Colors.red,
                percent: chosenBloodList.length / bloodList.length,
              ),
            );
          default:
            return Container(
              child: Text(
                "Ruh roh..."
              ),
            );
            break;
        }
      }
    );
    // return Container(
    //   child: Text(
    //     "Hi"
    //   ),
    // );
  }
}
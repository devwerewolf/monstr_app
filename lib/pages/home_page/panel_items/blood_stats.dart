import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/data/blood_list.dart';

class BloodStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BloodListBloc, BloodListState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadSuccessState:
            var bloodList = (state as LoadSuccessState).bloodList;
            var chosenBloodList = bloodList.where((currentBlood) => currentBlood.chosen);
            
            return Container(
              child: Text(
                chosenBloodList.length.toString()
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
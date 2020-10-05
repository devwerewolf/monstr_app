import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/data/blood_list.dart';
import 'package:monstr_app/design/checkbox_input.dart';
import 'package:monstr_app/models/blood.dart';

class SurvivalPage extends StatefulWidget {
  @override
  _SurvivalPageState createState() => _SurvivalPageState();
}

class _SurvivalPageState extends State<SurvivalPage> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Column(
  //       children: [
  //         InputCheckbox(
  //           text: "Am I streaming?"
  //         ),
  //         InputCheckbox(
  //           text: "Does Bruno Mars is gay?"
  //         ),
  //         InputCheckbox(
  //           text: "What is a 'werewolf'?"
  //         ),
  //       ],
  //     ),
  //   );
  // }
  
  @override
  Widget build(BuildContext context) {
    // TODO: Implement a `FilteredBloodList` bloc for scalability
    return BlocBuilder<BloodListBloc, BloodListState>(
      builder: (context, state) {
        
        switch (state.runtimeType) {
          case LoadSuccessState:
            var bloodList = (state as LoadSuccessState).bloodList;
        
            return Scaffold(
              body: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: bloodList.length,
              itemBuilder: (BuildContext context, int index) {
                Blood blood = bloodList[index];
                return CheckboxInput(text: blood.type, value: blood.chosen);
              }),
            );
          default:
            // TODO: Load the bloodList properly for clean code
            BlocProvider.of<BloodListBloc>(context).add(LoadSuccessEvent());
            
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
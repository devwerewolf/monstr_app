import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/data/blood_list.dart';
import 'package:monstr_app/design/checkbox_input.dart';
import 'package:monstr_app/models/blood.dart';
import 'package:monstr_app/utils/blood_list_utils.dart';

class SurvivalSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BloodListRender(
        render: (bloodList) {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: bloodList.length,
            itemBuilder: (context, index) {
              Blood blood = bloodList[index];
              
              return CheckboxInput(
                text: blood.type,
                value: blood.chosen,
                onValueChanged: (newValue) {
                  blood.chosen = newValue;
                  updateBloodList(context, blood);
                },
              );
            },
          );
        } ,
      )
    );
  }
}

// BlocBuilder<BloodListBloc, BloodListState>(
//         builder: (context, state) {
//           switch (state.runtimeType) {
//             case LoadSuccessState:
//               var bloodList = (state as LoadSuccessState).bloodList;
//               return ListView.builder(
//                 padding: const EdgeInsets.all(8),
//                 itemCount: bloodList.length,
//                 itemBuilder: (context, index) {
//                   Blood blood = bloodList[index];
                  
//                   return CheckboxInput(
//                     text: blood.type,
//                     value: blood.chosen,
//                     onValueChanged: (bool newValue) {
//                       blood.chosen = newValue;
//                       updateBloodList(context, blood);
//                     },
//                   );
//                 },
//               );
//           }
//         }
//       ),
import 'package:flutter/material.dart';
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
        }
      ),
    );
  }
}
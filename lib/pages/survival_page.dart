import 'package:flutter/material.dart';
import 'package:monstr_app/components/blood_group.dart';
import 'package:monstr_app/design/settings_button.dart';

class SurvivalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String route = ModalRoute.of(context).settings.name;
    print(route);
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.orange),
        child: Column(
          children: [
            SettingsButton(route: route,),
            BloodGroup(),
          ],
        ),
      ),
    );
  }
}
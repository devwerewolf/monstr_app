import 'package:flutter/material.dart';
import 'package:monstr_app/components/blood_group.dart';
import 'package:monstr_app/components/primary_page_container.dart';
import 'package:monstr_app/components/settings_button.dart';

class SurvivalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String route = ModalRoute.of(context).settings.name;
    
    return Scaffold(
      body: PrimaryPageContainer(
        borderColor: Color(0xffba000d),
        child: Column(
          children: [
            SettingsButton(route: route),
            BloodGroup(),
          ],
        ),
      ),
    );
  }
}
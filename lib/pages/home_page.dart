import 'package:flutter/material.dart';
import 'package:monstr_app/pages/home_page/cosmos_panel_list.dart';
import 'package:monstr_app/pages/home_page/love_panel_list.dart';
import 'package:monstr_app/pages/home_page/survival_panel_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CosmosPanelList(),
            LovePanelList(),
            SurvivalPanelList(),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:monstr_app/constants/custom_theme.dart';
// import 'package:monstr_app/components/sun_moon_cycle.dart';
import 'package:monstr_app/pages/home_page/cosmos_panel_list.dart';
import 'package:monstr_app/pages/home_page/love_panel_list.dart';
import 'package:monstr_app/pages/home_page/panel_list_divider.dart';
import 'package:monstr_app/pages/home_page/survival_panel_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CosmosPanelList(),
            PanelListDivider(color: CosmosPageBorderColor),
            LovePanelList(),
            PanelListDivider(color: LovePageBorderColor),
            SurvivalPanelList(),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:monstr_app/components/blood_stats.dart';
import 'package:monstr_app/constants/custom_theme.dart';
import 'package:monstr_app/design/panel.dart';
import 'package:monstr_app/design/panel_list.dart';
import 'package:monstr_app/utils/blood_list_utils.dart';

class SurvivalPanelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BloodListRender(
      render: (bloodList) {
        const panelColor = HomePagePanelColor;
        var chosenBloodList = bloodList.where((blood) => blood.chosen);
        var bloodStatsList = chosenBloodList.map((chosenBlood) => BloodStats(chosenBlood));
        
        // TODO: More widgets!
        var aggregateList = [...bloodStatsList];
        
        return PanelList(
          route: "/survival",
          color: panelColor,
          items: Panel.list(
            widgets: aggregateList,
            panelColor: panelColor,
          ),
        );
      },
    );
  }
}
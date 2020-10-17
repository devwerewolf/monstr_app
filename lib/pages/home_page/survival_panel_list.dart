import 'package:flutter/material.dart';
import 'package:monstr_app/components/blood_stats.dart';
import 'package:monstr_app/design/panel.dart';
import 'package:monstr_app/design/panel_list.dart';
import 'package:monstr_app/utils/blood_list_utils.dart';

class SurvivalPanelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BloodListRender(
      render: (bloodList) {
        const panelColor = Colors.orange;
        var chosenBloodList = bloodList.where((blood) => blood.chosen);
        var bloodStatsList = chosenBloodList.map((chosenBlood) => BloodStats(chosenBlood));
        
        var aggregateList = [...bloodStatsList];
        List<Panel> panelItems = aggregateList.map((widget) => Panel(item: widget, color: panelColor)).toList();
        
        return PanelList(
          route: "/survival",
          color: panelColor,
          items: panelItems,
        );
      },
    );
  }
}
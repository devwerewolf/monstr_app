import 'package:flutter/material.dart';
import 'package:monstr_app/components/sun_moon_cycle.dart';
import 'package:monstr_app/constants/custom_theme.dart';
import 'package:monstr_app/design/panel_list.dart';

class CosmosPanelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Construct the widget from data
    
    return PanelList(
      route: "/cosmos",
      color: HomePagePanelColor,
      items: [
        SunMoonCycle(context),
      ],
    );
  }
}
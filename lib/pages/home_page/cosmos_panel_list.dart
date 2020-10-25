import 'package:flutter/material.dart';
import 'package:monstr_app/components/celestial_entity.dart';
import 'package:monstr_app/components/sun_moon_cycle.dart';
import 'package:monstr_app/constants/custom_theme.dart';
import 'package:monstr_app/design/full_size_container.dart';
import 'package:monstr_app/design/panel_list.dart';

class CosmosPanelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PanelList(
      route: "/cosmos",
      color: HomePagePanelColor,
      items: [
        SunMoonCycle(context,
          render: (cycleState) {
            String dummyText = "Sun Moon Cycle 🐺";
            String celestialName = "sun";
            
            if (cycleState.isPastSunrise) {
              dummyText = "Rise and shine, nerd!";
            }
            
            if (cycleState.isPastSunset) {
              dummyText = "Go to bed, nerd!";
            }
            
            if (cycleState.isAfternoon) {
              dummyText = "Lunch!";
            }
            
            if (cycleState.isEvening) {
              dummyText = "Dinner!";
              celestialName = "moon";
            }
            
            return FullSizeContainer(
              child: CelestialEntity(
                name: celestialName,
                text: dummyText,
              )
            );
          },
        ),
      ],
    );
  }
}
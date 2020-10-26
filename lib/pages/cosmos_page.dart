import 'package:flutter/material.dart';
import 'package:monstr_app/components/celestial_entity.dart';
import 'package:monstr_app/components/moon_box.dart';
import 'package:monstr_app/components/primary_page_container.dart';
import 'package:monstr_app/components/sun_moon_cycle.dart';
import 'package:monstr_app/constants/custom_theme.dart';
import 'package:monstr_app/utils/moon_phase.dart';
import 'package:time/time.dart';

class CosmosPage extends StatefulWidget {
  @override
  _CosmosPageState createState() => _CosmosPageState();
}

class _CosmosPageState extends State<CosmosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryPageContainer(
        color: CosmosPageBorderColor,
        titleText: "Reach for the stars 🌟",
        child: SunMoonCycle(context,
          render: (cycleState) {
            MoonPhase moonPhase = Moon.phase(cycleState.rightNow.add(2.days));
            String displayMoonPhase;
            
            switch (moonPhase) {
              case MoonPhase.NewMoon:
                displayMoonPhase = "New Moon";
                break;
              case MoonPhase.FirstQuarter:
              case MoonPhase.LastQuarter:
                displayMoonPhase = "Quarter Moon";
                break;
              case MoonPhase.Full:
                displayMoonPhase = "Full Moon";
                break;
              case MoonPhase.WaningCrescent:
              case MoonPhase.WaxingCrescent:
                displayMoonPhase = "Crescent Moon";
                break;
              case MoonPhase.WaningGibbous:
              case MoonPhase.WaxingGibbous:
                displayMoonPhase = "Gibbous Moon";
                break;
              default:
                displayMoonPhase = "Idk Moon";
                break;
            }
            
            // print(displayMoonPhase);
            
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: MoonBox(moonPhase),
                ),
                Text(
                  displayMoonPhase,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: CelestialEntity(
                    name: "sunrise",
                    subtitleText: "${cycleState.sunrise}",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CelestialEntity(
                    name: "sunset",
                    // titleText: "Sunset",
                    subtitleText: "${cycleState.sunset}",
                  ),
                ),
              ],
            );
          }
        )
      )
    );
  }
}
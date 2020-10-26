import 'package:flutter/material.dart';
import 'package:monstr_app/utils/moon_phase.dart';

class MoonBox extends StatefulWidget {
  final MoonPhase moonPhase;
  
  MoonBox(this.moonPhase);
  
  @override
  _MoonBoxState createState() => _MoonBoxState();
}

class _MoonBoxState extends State<MoonBox> {
  @override
  Widget build(BuildContext context) {
    // TODO: Define clipping behavior
    const double boxHeight = 200;
    const double boxWidth = 200;
    final double halfBoxWidth = boxWidth / 2;
    final double quarterBoxWidth = boxWidth / 4;
    Color moonColor = Colors.white;
    double offset = 0;
    
    switch (widget.moonPhase) {
      case MoonPhase.NewMoon:
        moonColor = Colors.black;
        break;
      case MoonPhase.FirstQuarter:
        offset = -halfBoxWidth;
        break;
      case MoonPhase.LastQuarter:
        offset = halfBoxWidth;
        break;
      case MoonPhase.WaningGibbous:
        offset = -quarterBoxWidth;
        break;
      case MoonPhase.WaxingGibbous:
        offset = quarterBoxWidth;
        break;
      case MoonPhase.FirstQuarter:
        offset = -halfBoxWidth - quarterBoxWidth;
        break;
      case MoonPhase.LastQuarter:
        offset = halfBoxWidth + quarterBoxWidth;
        break;
      default:
        break;
    }
    
    return Stack(
      children: [
        SizedBox(
          height: boxHeight,
          width: boxWidth,
          child: Stack(
            children: [
              Positioned(
                left: offset,
                child: ClipOval(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: moonColor,
                    ),
                    child: SizedBox(
                      height: boxHeight,
                      width: boxWidth,
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      ]
    );
  }
}
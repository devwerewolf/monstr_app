import 'dart:async';
import 'package:daylight/daylight.dart';
import 'package:flutter/material.dart';
import 'package:time/time.dart';
import 'package:flutter_suncalc/flutter_suncalc.dart';

class SunMoonCycle extends StatefulWidget {
  final BuildContext context;
  
  SunMoonCycle(this.context);
  
  @override
  _SunMoonCycleState createState() => _SunMoonCycleState();
}

class _SunMoonCycleState extends State<SunMoonCycle> {
  Timer _timer;
  DateTime _now = DateTime.now().toUtc();
  
  bool get isCurrentRoute => ModalRoute.of(widget.context).isCurrent;
  
  DaylightLocation get losAngeles => DaylightLocation(34.0522, 118.2437);
  DaylightCalculator get losAngelesCalculator => DaylightCalculator(losAngeles);
  DateTime get sunrise => losAngelesCalculator.calculateEvent(
    _now,
    Zenith.golden,
    EventType.sunrise,
  ).toUtc();
  DateTime get sunset => losAngelesCalculator.calculateEvent(
    _now,
    Zenith.golden,
    EventType.sunset,
  ).toLocal();
  
  DateTime get rightNow => _now.toLocal();
  bool get isPastSunrise => rightNow.isAfter(sunrise);
  bool get isPastSunset => rightNow.isAfter(sunset);
  
  @override
  void initState() {
    _timer = Timer.periodic(1.seconds, (timer) {
      if (isCurrentRoute) {
        setState(() {
          _now = DateTime.now().toUtc();
        });
      }
    });
    
    super.initState();
  }
  
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    String dummyText = "Sun Moon Cycle 🐺";
    
    if (isPastSunrise) {
      dummyText = "RISE AND SHINE, BITCH!";
    }
    
    if (isPastSunset) {
      dummyText = "GO TO BED, NERD!";
    }
    
    return Text(
      // dummyText
      "${sunset.difference(rightNow)} | $sunset | $isPastSunset"
    );
  }
}
import 'dart:async';
import 'dart:math';
// import 'package:daylight/daylight.dart';
import 'package:flutter/material.dart';
import 'package:monstr_app/components/title_text.dart';
import 'package:monstr_app/constants/suncalc_offset.dart';
import 'package:monstr_app/design/full_size_container.dart';
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
  DateTime _now = DateTime.now();
  Map<String, DateTime> _sunTimes = Map();
  Map<String, num> _sunPositions = Map();
  Map<String, DateTime> _moonTimes = Map();
  Map<String, num> _moonPositions = Map();
  num _lat = 39.833;
  num _long = -98.583;
  
  bool get isCurrentRoute => ModalRoute.of(widget.context).isCurrent;
  DateTime get rightNow => _now.toLocal();
  
  DateTime get sunrise => _sunTimes["sunrise"].add(sunriseOffset).toLocal();
  DateTime get sunset => _sunTimes["sunset"].add(sunsetOffset).toLocal();
  num get sunAltitude => _sunPositions["altitude"];
  num get sunImageFromBottom => 128 * sin(sunAltitude) - 256;
  
  bool get isPastSunrise => rightNow.isAfter(sunrise);
  bool get isPastSunset => rightNow.isAfter(sunset);
  bool get isMorning => !isPastSunrise && sunAltitude <= PI/2;
  bool get isAfternoon => isPastSunrise && sunAltitude >= 0;
  bool get isEvening => sunAltitude <= 0;
  
  @override
  void initState() {
    _timer = Timer.periodic(1.seconds, (timer) {
      if (isCurrentRoute) {
        setState(() {
          _now = DateTime.now().toUtc();
          _sunTimes = SunCalc.getTimes(_now, _lat, _long);
          _sunPositions = SunCalc.getPosition(_now, _lat, _long);
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
      dummyText = "Rise and shine, nerd!";
    }
    
    if (isPastSunset) {
      dummyText = "Go to bed, nerd!";
    }
    
    if (isAfternoon) {
      dummyText = "Lunch!";
    }
    
    if (isEvening) {
      dummyText = "Dinner!";
    }
    
    print("$rightNow | $_sunPositions | ${sin(sunAltitude)}");
    
    return Stack(
      children: [
        // TODO: Polish by using an AnimatedPositioned
        // - Set the duration for 1 second
        // - Use a linear animation curve
        Positioned.fill(
          bottom: sunImageFromBottom,
          child: Center(
            child: Image.asset(
              "assets/sun.png"
            ),
          ),
        ),
        Positioned.fill(
          child: TitleText(
            text: "$dummyText | $sunAltitude",
          ),
        ),
      ],
    );
  }
}
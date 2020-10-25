import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:monstr_app/constants/suncalc_offset.dart';
import 'package:monstr_app/design/full_size_container.dart';
import 'package:time/time.dart';
import 'package:flutter_suncalc/flutter_suncalc.dart';

class SunMoonCycle extends StatefulWidget {
  final BuildContext context;
  final Function(_SunMoonCycleState cycleState) render;
  
  SunMoonCycle(this.context, {this.render});
  
  @override
  _SunMoonCycleState createState() => _SunMoonCycleState();
}

class _SunMoonCycleState extends State<SunMoonCycle> {
  Timer _timer;
  DateTime _now = DateTime.now();
  Map<String, DateTime> _sunTimes = Map();
  num _lat = 39.833;
  num _long = -98.583;
  Map<String, num> _sunPositions = Map();
  Map<String, DateTime> _moonTimes = Map();
  Map<String, num> _moonPositions = Map();
  
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
  
  _SunMoonCycleState() {
    _now = DateTime.now().toUtc();
    _sunTimes = SunCalc.getTimes(_now, _lat, _long);
    _sunPositions = SunCalc.getPosition(_now, _lat, _long);
  }
  
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
    return FullSizeContainer(
      child: widget.render(this)
    );
  }
}
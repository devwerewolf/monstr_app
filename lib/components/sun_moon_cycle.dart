import 'dart:async';
import 'package:time/time.dart';
import 'package:flutter/material.dart';

class SunMoonCycle extends StatefulWidget {
  final Function(DateTime now) render;
  
  SunMoonCycle({@required this.render});
  
  @override
  _SunMoonCycleState createState() => _SunMoonCycleState();
}

class _SunMoonCycleState extends State<SunMoonCycle> {
  DateTime now = DateTime.now();
  
  _SunMoonCycleState() {
    Timer.periodic(1.seconds, (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return widget.render(now);
  }
}
import 'dart:async';
import 'package:time/time.dart';
import 'package:flutter/material.dart';

class SunMoonCycle extends StatefulWidget {
  final BuildContext context;
  
  SunMoonCycle(this.context);
  
  @override
  _SunMoonCycleState createState() => _SunMoonCycleState();
}

class _SunMoonCycleState extends State<SunMoonCycle> {
  Timer _timer;
  DateTime now = DateTime.now();
  
  bool get isCurrentRoute => ModalRoute.of(widget.context).isCurrent;
  
  @override
  void initState() {
    _timer = Timer.periodic(1.seconds, (timer) {
      // Check if still on that route
      if (isCurrentRoute) {
        setState(() {
          now = DateTime.now();
          print(now);
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
    return Text(
      now.toString()
    );
  }
}
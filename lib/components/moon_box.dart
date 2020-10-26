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
    return ClipOval(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: SizedBox(
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
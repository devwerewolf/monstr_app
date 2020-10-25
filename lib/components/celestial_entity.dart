import 'package:flutter/material.dart';
import 'package:monstr_app/constants/custom_theme.dart';

class CelestialEntity extends StatefulWidget {
  final String name;
  final String text;
  
  CelestialEntity({@required this.name, this.text});
  
  @override
  _CelestialEntityState createState() => _CelestialEntityState();
}

class _CelestialEntityState extends State<CelestialEntity> {
  @override
  Widget build(BuildContext context) {
    List<Widget> rowWidgets = [
      Image.asset(
        "assets/${widget.name}.png",
        width: 128,
        height: 128,
      )
    ];
    
    if (widget.text != null) {
      rowWidgets.insert(0,
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40
            ),
            textAlign: TextAlign.center,
          ),
        )
      );
    }
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowWidgets,
    );
  }
}
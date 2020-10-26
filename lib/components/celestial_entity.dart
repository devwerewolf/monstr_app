import 'package:flutter/material.dart';
import 'package:monstr_app/constants/custom_theme.dart';

class CelestialEntity extends StatefulWidget {
  final String name;
  final String titleText;
  final String subtitleText;
  
  CelestialEntity({@required this.name, this.titleText, this.subtitleText});
  
  @override
  _CelestialEntityState createState() => _CelestialEntityState();
}

class _CelestialEntityState extends State<CelestialEntity> {
  @override
  Widget build(BuildContext context) {
    List<Widget> myWidgets = [
      Image.asset(
        "assets/${widget.name}.png",
        width: 128,
        height: 128,
      )
    ];
    
    if (widget.titleText != null) {
      myWidgets.insert(0,
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            widget.titleText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40
            ),
            textAlign: TextAlign.center,
          ),
        )
      );
    }
    
    if (widget.subtitleText != null) {
      myWidgets.add(
        Text(
          widget.subtitleText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        )
      );
    }
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: myWidgets,
    );
  }
}
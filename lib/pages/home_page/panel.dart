import 'package:flutter/material.dart';

class Panel extends StatefulWidget {
  final String route;
  
  Panel({Key key, @required this.route}) : super(key: key);
  
  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  
  void _goToRoute() {
    Navigator.pushNamed(context, widget.route);
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goToRoute,
      child: Text(
        widget.route
      ),
    );
  }
}

// State
// - "onClick" equivalent => goes to respective page (e.g. "Cosmos" panel -> "Cosmos" page)
// - Renders provided data (e.g. "Food") in PanelItems which scroll
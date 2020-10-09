import 'package:flutter/material.dart';

class Panel extends StatefulWidget {
  final String route;
  final List<Widget> items;
  
  // TODO: Make items required?
  Panel({Key key, @required this.route, this.items = const[]}) : super(key: key);
  
  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  
  void _goToRoute() {
    Navigator.pushNamed(context, widget.route);
  }
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
          onTap: _goToRoute,
          child: Container(
            decoration: BoxDecoration(color: Colors.teal),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                Widget item = widget.items[index];
                return item;
              }
            ),
          ),
        ),
      );
  }
}

// State
// - "onClick" equivalent => goes to respective page (e.g. "Cosmos" panel -> "Cosmos" page)
// - Renders provided data (e.g. "Food") in PanelItems which scroll
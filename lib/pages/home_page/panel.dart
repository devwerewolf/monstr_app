import 'package:flutter/material.dart';
import 'package:monstr_app/design/full_size_container.dart';

class Panel extends StatefulWidget {
  final String route;
  final List<Widget> items;
  final Color color;
  
  // TODO: Make items required?
  Panel({Key key, @required this.route, this.items = const[], this.color = Colors.white}) : super(key: key);
  
  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  
  void _goToRoute() {
    Navigator.pushNamed(context, widget.route);
  }
  
  @override
  Widget build(BuildContext context) {
    var panelItemList = widget.items.map((itemElement) {
      return FullSizeContainer(
        dimension: Dimension.width,
        child: itemElement,
      );
    }).toList();
    
    return Expanded(
      child: GestureDetector(
        onTap: _goToRoute,
        child: Container(
          decoration: BoxDecoration(color: widget.color),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(),
            children: panelItemList,
          ),
        ),
      ),
    );
  }
}

// State
// - "onClick" equivalent => goes to respective page (e.g. "Cosmos" panel -> "Cosmos" page)
// - Renders provided data (e.g. "Food") in PanelItems which scroll
import 'package:flutter/material.dart';
import 'package:monstr_app/design/full_size_container.dart';
import 'package:monstr_app/design/panel.dart';

class PanelList extends StatefulWidget {
  final String route;
  final List<Widget> items;
  final Color color;
  
  PanelList({Key key, 
    @required this.route,
    this.items = const[],
    this.color = Colors.white,
  }) : super(key: key);
  
  @override
  _PanelListState createState() => _PanelListState();
}

class _PanelListState extends State<PanelList> {
  
  void _goToRoute() {
    Navigator.pushNamed(context, widget.route);
  }
  
  @override
  Widget build(BuildContext context) {
    var panelItemList = widget.items.map((panelItem) => Panel(item: panelItem, color: widget.color)).toList();
    
    if (panelItemList.isEmpty) {
      panelItemList = [
        Panel(item: Container(), color: widget.color),
      ];
    }
    
    return Expanded(
      child: GestureDetector(
        onTap: _goToRoute,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: PageScrollPhysics(),
          children: panelItemList,
        ),
      ),
    );
  }
}

// State
// - "onClick" equivalent => goes to respective page (e.g. "Cosmos" panel -> "Cosmos" page)
// - Renders provided data (e.g. "Food") in PanelItems which scroll
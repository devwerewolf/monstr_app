import 'package:flutter/material.dart';
import 'package:monstr_app/design/full_size_container.dart';
import 'package:monstr_app/design/panel.dart';

enum PanelListRender {
  Row,
  Column,
  Scroll,
}

class PanelList extends StatefulWidget {
  final String route;
  final List<Widget> items;
  final Color color;
  final PanelListRender render;
  
  PanelList({Key key,
    this.route,
    this.items = const[],
    this.color = Colors.white,
    this.render = PanelListRender.Scroll
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
    var panelList = widget.items.map((panel) => Panel(item: panel, color: widget.color)).toList();
    bool hasRoute = widget.route != null;
    Widget childView;
    
    // TODO: Decide whether or not to keep this; is this desired behavior?
    if (panelList.isEmpty) {
      panelList = [
        Panel(item: Container(), color: widget.color),
      ];
    }
    
    switch (widget.render) {
      case PanelListRender.Row:
        childView = Row(
          children: panelList,
        );
        break;
      case PanelListRender.Column:
        childView = Column(
          children: panelList,
        );
        break;
      case PanelListRender.Scroll:
      default:
        childView = ListView(
          scrollDirection: Axis.horizontal,
          physics: PageScrollPhysics(),
          children: panelList,
        );
    }
    
    return Expanded(
      child: GestureDetector(
        onTap: hasRoute ? _goToRoute : () {},
        child: childView,
      ),
    );
  }
}

// State
// - "onClick" equivalent => goes to respective page (e.g. "Cosmos" panel -> "Cosmos" page)
// - Renders provided data (e.g. "Food") in PanelItems which scroll
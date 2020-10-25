import 'package:flutter/material.dart';
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
    // Navigator.pushReplacementNamed(context, widget.route);
  }
  
  @override
  Widget build(BuildContext context) {
    var panelList = Panel.list(widgets: widget.items, panelColor: widget.color);
    bool hasRoute = widget.route != null;
    Widget childView;
    
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
        childView = Center(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(),
            children: panelList,
          ),
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

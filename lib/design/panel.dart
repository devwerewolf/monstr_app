import 'package:flutter/material.dart';
import 'package:monstr_app/design/full_size_container.dart';

class Panel extends StatefulWidget {
  final Color color;
  final Widget item;
  
  Panel({ @required this.item, this.color });
  
  static List<Panel> list({List<Widget> widgets, Color panelColor}) {
    var panelItems = widgets.map((widget) => Panel(item: widget, color: panelColor)).toList();
    return panelItems;
  }
  
  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  @override
  Widget build(BuildContext context) {
    return FullSizeContainer(
      dimension: Dimension.width,
      decoration: BoxDecoration(color: widget.color),
      child: widget.item,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:monstr_app/design/full_size_container.dart';

class Panel extends StatefulWidget {
  final Color color;
  final Widget item;
  
  Panel({ @required this.item, this.color });
  
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
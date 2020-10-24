import 'package:flutter/material.dart';

class PanelListDivider extends StatefulWidget {
  final Color color;
  
  PanelListDivider({this.color});
  
  @override
  _PanelListDividerState createState() => _PanelListDividerState();
}

class _PanelListDividerState extends State<PanelListDivider> {
  @override
  Widget build(BuildContext context) {
    double myIndent = 20;
    
    return Divider(
      color: widget.color,
      height: 0,
      indent: myIndent,
      endIndent: myIndent,
      thickness: 5,
    );
  }
}
import 'package:flutter/material.dart';

class ItemDivider extends StatefulWidget {
  final Color color;
  
  ItemDivider({this.color});
  
  @override
  _ItemDividerState createState() => _ItemDividerState();
}

class _ItemDividerState extends State<ItemDivider> {
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
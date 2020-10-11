import 'package:flutter/material.dart';

enum Dimension {
  width,
  height,
  all,
}

class FullSizeContainer extends StatefulWidget {
  final Dimension dimension;
  final BoxDecoration decoration;
  final Widget child;
  
  FullSizeContainer({this.dimension = Dimension.width, this.child, this.decoration});
  
  @override
  _FullSizeContainerState createState() => _FullSizeContainerState();
}

class _FullSizeContainerState extends State<FullSizeContainer> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width;
    double height;
    
    switch (widget.dimension) {
      case Dimension.width:
        width = screenSize.width;
        break;
      case Dimension.height:
        height = screenSize.height;
        break;
      case Dimension.all:
      default:
        width = screenSize.width;
        height = screenSize.height;
        break;
    }
    
    return Container(
      width: width,
      height: height,
      decoration: widget.decoration,
      child: widget.child,
    );
  }
}
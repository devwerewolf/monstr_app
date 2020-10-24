import 'package:flutter/material.dart';
import 'package:monstr_app/constants/custom_theme.dart';

class PrimaryPageContainer extends StatefulWidget {
  final Widget child;
  final Color borderColor;
  
  PrimaryPageContainer({@required this.child, this.borderColor = Colors.white});
  
  @override
  _PrimaryPageContainerState createState() => _PrimaryPageContainerState();
}

class _PrimaryPageContainerState extends State<PrimaryPageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HomePagePanelColor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(
                color: widget.borderColor,
                width: 5,
              ),
            ),
          ),
          child: widget.child
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:monstr_app/constants/custom_theme.dart';
import 'package:monstr_app/design/title_text.dart';

class PrimaryPageContainer extends StatefulWidget {
  final String titleText;
  final Widget child;
  final Color color;
  
  PrimaryPageContainer({@required this.child, this.color = Colors.white, this.titleText});
  
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
                color: widget.color,
                width: 5,
              ),
            ),
          ),
          child: Column(
            children: [
              TitleText(
                color: widget.color,
                text: widget.titleText
              ),
              widget.child,
            ],
          )
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class TitleText extends StatefulWidget {
  final String text;
  final Color color;
  
  TitleText({@required this.text, this.color});
  
  @override
  _TitleTextState createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontFamily: "Grenze",
        fontSize: 40,
        color: widget.color
      ),
      textAlign: TextAlign.center,
    );
  }
}
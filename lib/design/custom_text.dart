import 'package:flutter/material.dart';

const List<double> Titles = const [
  40,
  30,
  20,
  15,
  10,
  8
];

class CustomText extends StatefulWidget {
  final String text;
  final num size;
  final bool centered;
  
  CustomText(this.text, {this.size = 15, this.centered = false});
  
  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: widget.size,
      ),
      textAlign: widget.centered ? TextAlign.center : TextAlign.start,
    );
  }
}
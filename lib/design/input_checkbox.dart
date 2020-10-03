import 'package:flutter/material.dart';

class InputCheckbox extends StatefulWidget {
  final String text;
  
  InputCheckbox({ Key key, @required this.text }) : super(key: key);
  
  @override
  _InputCheckboxState createState() => _InputCheckboxState();
}

class _InputCheckboxState extends State<InputCheckbox> {
  bool _value = false;
  
  bool get value => _value;
  
  void _changeValue(bool newValue) {
    setState(() {
      _value = !_value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Material(
            child: Checkbox(
              onChanged: (bool newValue) { _changeValue(newValue); },
              tristate: false,
              value: value,
            ),
          ),
          Text(
            widget.text,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
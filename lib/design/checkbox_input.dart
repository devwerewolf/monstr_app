import 'package:flutter/material.dart';

class CheckboxInput extends StatefulWidget {
  final String text;
  final bool value;
  final Function(bool) onValueChanged;
  
  CheckboxInput({ Key key, @required this.text, this.value = false, this.onValueChanged }) : super(key: key);
  
  @override
  _CheckboxInputState createState() => _CheckboxInputState();
}

class _CheckboxInputState extends State<CheckboxInput> {
  bool _value;
  
  bool get value => _value;
  
  void _changeValue(bool newValue) {
    setState(() {
      this._value = newValue;
    });
    
    if (widget.onValueChanged != null) {
      widget.onValueChanged(newValue);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    _value = widget.value;
    
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Material(
            child: Checkbox(
              onChanged: (bool newValue) { _changeValue(newValue); },
              tristate: false,
              value: _value,
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
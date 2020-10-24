import 'package:flutter/material.dart';
import 'package:monstr_app/constants/custom_theme.dart';

class SettingsButton extends StatefulWidget {
  final String route;
  
  SettingsButton({this.route});
  
  @override
  _SettingsButtonState createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  void _goToSettings() {
    String settingsRoute = widget.route + "/settings";
    Navigator.pushNamed(context, settingsRoute);
  }
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings, color: HomePageTextColor,),
      onPressed: _goToSettings,
    );
  }
}
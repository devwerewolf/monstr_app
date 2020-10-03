import 'package:flutter/material.dart';
import 'package:monstr_app/pages/home_page/panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Panel>[
            // TODO: Panel data array
            Panel(
              route: '/cosmos',
            ),
            Panel(
              route: '/love',
            ),
            Panel(
              route: '/survival',
            ),
          ],
        ),
      ),
    );
  }
}
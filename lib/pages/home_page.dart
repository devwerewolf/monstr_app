import 'package:flutter/material.dart';
import 'package:monstr_app/pages/home_page/panel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Panel>[
            // TODO: Panel data array
            Panel(
              route: '/cosmos',
              items: [],
            ),
            Panel(
              route: '/love',
              items: [],
            ),
            Panel(
              route: '/survival',
              items: [],
            ),
          ],
        ),
      ),
    );
  }
}
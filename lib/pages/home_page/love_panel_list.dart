import 'package:flutter/material.dart';
import 'package:monstr_app/design/firestore_collection.dart';
import 'package:monstr_app/design/panel.dart';
import 'package:monstr_app/design/panel_list.dart';
import 'package:monstr_app/models/affirmation.dart';

class LovePanelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Construct the widget from data
    
    return FirestoreCollection(
      path: "affirmations",
      render: (documentSnapshots) {
        const panelColor = Colors.green;
        var affirmations = Affirmation.list(documentSnapshots);
        var affirmationWidgets = affirmations.map((affirmation) => Text(affirmation.text));
        List<Panel> panelItems = affirmationWidgets.map((widget) => Panel(item: widget, color: panelColor)).toList();
        
        return PanelList(
          route: "/love",
          items: panelItems,
          color: panelColor,
        );
      },
    );
  }
}
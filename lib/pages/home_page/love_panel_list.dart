import 'package:flutter/material.dart';
import 'package:monstr_app/design/title_text.dart';
import 'package:monstr_app/constants/custom_theme.dart';
import 'package:monstr_app/design/custom_text.dart';
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
        const panelColor = HomePagePanelColor;
        var affirmations = Affirmation.list(documentSnapshots);
        var affirmationWidgets = affirmations.map((affirmation) {
          // return TitleText(
          //   text: affirmation.text
          // );
          
          // return CustomText(
          //   affirmation.text,
          //   size: Titles[0],
          //   centered: true,
          // );
          
          return Text(
            affirmation.text,
            style: TextStyle(
              color: HomePageTextColor,
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          );
        });
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
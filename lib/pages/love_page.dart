import 'package:flutter/material.dart';
import 'package:monstr_app/components/primary_page_container.dart';
import 'package:monstr_app/constants/custom_theme.dart';
import 'package:monstr_app/design/firestore_collection.dart';
import 'package:monstr_app/design/full_size_container.dart';
import 'package:monstr_app/models/affirmation.dart';

class LovePage extends StatefulWidget {
  @override
  _LovePageState createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryPageContainer(
        titleText: "Love thyself 🧡",
        color: LovePageBorderColor,
        child: FirestoreCollection(
          path: "affirmations",
          render: (documentSnapshots) {
            var affirmations = Affirmation.list(documentSnapshots);
            var affirmationWidgets = affirmations.map((affirmation) => 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  affirmation.text,
                  style: TextStyle(
                    color: HomePageTextColor,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
            
            return FullSizeContainer(
              child: Column(
                children: [
                  ...affirmationWidgets
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
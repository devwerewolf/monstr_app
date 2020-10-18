import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monstr_app/data/affirmations/affirmations_repo.dart';
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
      body: FullSizeContainer(
        decoration: BoxDecoration(color: Colors.green),
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("affirmations").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (!snapshot.hasData) return LinearProgressIndicator();
              
              var documentSnapshots = snapshot.data.documents;
              var affirmations = documentSnapshots.map((documentSnapshot) => Affirmation.fromSnapshot(documentSnapshot));
              var affirmationWidgets = affirmations.map((affirmation) => Text(affirmation.text)).toList();
              
              return Column(
                children: affirmationWidgets,
              );
            }
            
            return Container();
          },
        ),
      ),
    );
  }
}
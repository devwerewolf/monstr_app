import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreCollection extends StatefulWidget {
  final String path;
  final Function(List<DocumentSnapshot> documentSnapshots) render;
  
  FirestoreCollection(this.path, {this.render});
  
  @override
  _FirestoreCollectionState createState() => _FirestoreCollectionState();
}

class _FirestoreCollectionState extends State<FirestoreCollection> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(widget.path).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          
          var documentSnapshots = snapshot.data.documents;
          return widget.render(documentSnapshots);
        }
        
        return Container();
      },
    );
  }
}
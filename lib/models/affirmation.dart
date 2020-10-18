import 'package:cloud_firestore/cloud_firestore.dart';

class Affirmation {
  String text;
  String category;
  
  Affirmation({this.text, this.category});
  Affirmation.fromSnapshot(DocumentSnapshot documentSnapshot) {
    var data = documentSnapshot.data;
    text = data["text"];
    category = data["category"];
  }
}
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monstr_app/models/affirmation.dart';

// class AffirmationsRepo {
//   final affirmationsCollection = Firestore.instance.collection("affirmations");
  
//   Stream<List<Affirmation>> affirmations() {
//     return affirmationsCollection.snapshots().map((snapshot) {
//       return snapshot.documents.map((doc) => (doc.data as Affirmation)).toList();
//     });
//   }
// }

final affirmationsCollection = Firestore.instance.collection("affirmations");
  
Stream<List<Affirmation>> affirmations() {
  return affirmationsCollection.snapshots().map((snapshot) {
    return snapshot.documents.map((doc) => (doc.data as Affirmation)).toList();
  });
}

import 'package:uuid/uuid.dart';

class FoodGroup {
  bool chosen;
  String category;
  String _id = Uuid().v4();
  
  String get id => _id;
  
  FoodGroup({this.category, this.chosen = false});
}

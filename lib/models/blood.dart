import 'package:uuid/uuid.dart';

class Blood {
  bool chosen;
  String type;
  String _id = Uuid().v4();
  
  String get id => _id;
  
  Blood({this.chosen = false, this.type});
}
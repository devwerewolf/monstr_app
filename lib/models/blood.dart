import 'package:uuid/uuid.dart';

class Blood {
  bool chosen;
  String type;
  double currentAmount;
  double maxAmount;
  String _id = Uuid().v4();
  
  String get id => _id;
  
  double get percentageAmount => currentAmount / maxAmount;
  
  Blood({this.chosen = false, this.type, this.currentAmount = 0, this.maxAmount = 10});
}
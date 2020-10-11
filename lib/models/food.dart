import 'package:uuid/uuid.dart';

mixin Food {
  bool chosen = false;
  double currentAmount = 0;
  double maxAmount = 10;
  String _id = Uuid().v4();
  
  String get id => _id;
  
  double get percentageAmount => currentAmount / maxAmount;
}
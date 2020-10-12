import 'package:monstr_app/models/food_group.dart';

abstract class FoodGroupListEvent {
  // TODO: Figure out if canonicalized constructors are necessary
  const FoodGroupListEvent();
}

class LoadSuccessEvent extends FoodGroupListEvent{}

class ListUpdatedEvent extends FoodGroupListEvent {
  final List<FoodGroup> foodGroupList;
  
  const ListUpdatedEvent(this.foodGroupList);
}

class UpdatedEvent extends FoodGroupListEvent {
  final FoodGroup foodGroup;
  
  const UpdatedEvent(this.foodGroup);
}
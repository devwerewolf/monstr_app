import 'package:monstr_app/models/food_group.dart';

abstract class FoodGroupListState {
  const FoodGroupListState();
}

class LoadInProgressState extends FoodGroupListState{}

class LoadSuccessState extends FoodGroupListState {
  final List<FoodGroup> foodGroupList;
  
  const LoadSuccessState([this.foodGroupList = const[]]);
}

class LoadFailureState extends FoodGroupListState {}

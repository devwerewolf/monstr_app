import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:monstr_app/data/food_group_list/food_group_list_event.dart';
import 'package:monstr_app/data/food_group_list/food_group_list_state.dart';
import 'package:monstr_app/models/food_group.dart';

class FoodGroupListBloc extends Bloc<FoodGroupListEvent, FoodGroupListState> {
  FoodGroupListBloc() : super(LoadInProgressState());

  @override
  Stream<FoodGroupListState> mapEventToState(FoodGroupListEvent event) async* {
    switch (event.runtimeType) {
      case LoadSuccessEvent:
        yield* _mapLoadSuccess();
        break;
      case UpdatedEvent:
        yield* _mapUpdated(event);
        break;
    }
  }
  
  Stream<FoodGroupListState> _mapLoadSuccess() async* {
    try {
      List<FoodGroup> foodGroupList = [
        FoodGroup(category: "Blood"),
        FoodGroup(category: "Brains"),
        FoodGroup(category: "Souls"),
      ];
      
      yield LoadSuccessState(foodGroupList);
    }
    catch (_) {
      yield LoadFailureState();
    }
  }
  
  Stream<FoodGroupListState> _mapUpdated(UpdatedEvent event) async* {
    if (state is LoadSuccessState) {
      var foodGroupList = (state as LoadSuccessState).foodGroupList;
      
      var updatedFoodGroupList = 
        foodGroupList
        .map((currentFoodGroup) {
            if (currentFoodGroup.id == event.foodGroup.id) return event.foodGroup;
            else return currentFoodGroup;
        })
        .toList();
      
      yield LoadSuccessState(updatedFoodGroupList);
    }
  }
}
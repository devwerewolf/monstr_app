import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:monstr_app/data/blood_list.dart';
import 'package:monstr_app/models/blood.dart';

class BloodListBloc extends Bloc<BloodListEvent, BloodListState> {
  BloodListBloc() : super(LoadInProgressState());

  @override
  Stream<BloodListState> mapEventToState(BloodListEvent event) async* {
    switch (event.runtimeType) {
      case LoadSuccessEvent:
        yield* _mapLoadSuccess();
        break;
      case UpdatedEvent:
        yield* _mapUpdated(event);
        break;
    }
  }
  
  Stream<BloodListState> _mapLoadSuccess() async* {
    try {
      // TODO: Load bloodList from an actual source for production purposes
      List<Blood> bloodList = [
        Blood(type: "A+", chosen: true),
        Blood(type: "A-"),
        Blood(type: "B+"),
        Blood(type: "B-", chosen: true),
        Blood(type: "O+"),
        Blood(type: "O-"),
      ];
      
      yield LoadSuccessState(bloodList);
    }
    catch (_) {
      yield LoadFailureState();
    }
  }
  
  Stream<BloodListState> _mapUpdated(UpdatedEvent event) async* {
    if (state is LoadSuccessState) {
      var bloodList = (state as LoadSuccessState).bloodList;
      var updatedBloodList = 
        bloodList
        .map(
          (currentBlood) {
            if (currentBlood.id == event.blood.id) return event.blood;
            else return currentBlood;
          }
        )
        .toList();
      yield LoadSuccessState(updatedBloodList);
    }
  }
}
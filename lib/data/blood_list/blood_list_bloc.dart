import 'dart:async';
import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:monstr_app/data/blood_list/blood_list_event.dart';
import 'package:monstr_app/data/blood_list/blood_list_state.dart';
import 'package:monstr_app/models/blood.dart';

class BloodListBloc extends Bloc<BloodListEvent, BloodListState> {
  BloodListBloc() : super(LoadInProgressState());

  @override
  Stream<BloodListState> mapEventToState(BloodListEvent event) async* {
    switch (event.runtimeType) {
      case LoadSuccessEvent:
        yield* _mapLoadSuccess();
        
        // TODO: Figure out if "break" is necessary after yield* for removing redundant code
        break;
    }
    
    // if (event is LoadSuccessEvent) {
    //   yield* _mapLoadSuccess();
    // }
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
}
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/components/blood_stats.dart';
import 'package:monstr_app/data/blood_list.dart';
import 'package:monstr_app/models/blood.dart';

BloodListBloc _bloodListBloc(BuildContext context) {
  return BlocProvider.of<BloodListBloc>(context);
}

void initBloodList(BuildContext context) {
  // TODO: Make smarter
  _bloodListBloc(context).add(LoadSuccessEvent());
}

void updateBloodList(BuildContext context, Blood blood) {
  _bloodListBloc(context).add(UpdatedEvent(blood));
}

List<Blood> fetchBloodList(BuildContext context) {
  var state = _bloodListBloc(context).state;
  
  switch (state.runtimeType) {
    case LoadSuccessState:
      var bloodList = (state as LoadSuccessState).bloodList;
      return bloodList;
    case LoadInProgressState:
      return [];
  }
}

List<BloodStats> fetchBloodStatsList(BuildContext context) {
  var bloodList = fetchBloodList(context);
  var chosenBloodList = bloodList.where((blood) => blood.chosen);
  var bloodStatsList = chosenBloodList.map((blood) => BloodStats(blood: blood,)).toList();
  
  return bloodStatsList;
}
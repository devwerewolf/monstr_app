import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/components/blood_stats.dart';
import 'package:monstr_app/data/blood_list.dart';
import 'package:monstr_app/models/blood.dart';

void initBloodList(BuildContext context) {
  // TODO: Make smarter
  BlocProvider.of<BloodListBloc>(context).add(LoadSuccessEvent());
}

List<Blood> fetchBloodList(BuildContext context) {
  var state = BlocProvider.of<BloodListBloc>(context).state;
  var bloodList = (state as LoadSuccessState).bloodList;
  
  return bloodList;
}

List<BloodStats> fetchBloodStatsList(BuildContext context) {
  var bloodList = fetchBloodList(context);
  var chosenBloodList = bloodList.where((blood) => blood.chosen);
  var bloodStatsList = chosenBloodList.map((blood) => BloodStats(blood: blood,)).toList();
  
  return bloodStatsList;
}
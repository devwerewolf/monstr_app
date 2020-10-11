import 'package:monstr_app/models/blood.dart';

abstract class BloodListState {
  // [LEARN] "Canonicalized" constructor
  const BloodListState();
}

class LoadInProgressState extends BloodListState {}

class LoadSuccessState extends BloodListState {
  final List<Blood> bloodList;
  
  // TODO: Look up List (de?)constructors for my own educational benefit
  const LoadSuccessState([this.bloodList = const[]]);
  
  // // [DEBUG]
  // @override
  // String toString() => 'LoadSuccess : { bloodList: $bloodList }';
}

class LoadFailureState extends BloodListState {}
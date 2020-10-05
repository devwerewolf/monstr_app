import 'package:equatable/equatable.dart';
import 'package:monstr_app/models/blood.dart';

abstract class BloodListState extends Equatable {
  // [LEARN] "Canonicalized" constructor
  const BloodListState();
  
  // [REQUIRED] for Equatable
  @override
  List<Object> get props => [];
}

class LoadInProgressState extends BloodListState {}

class LoadSuccessState extends BloodListState {
  final List<Blood> bloodList;
  
  // TODO: Look up List (de?)constructors for my own educational benefit
  const LoadSuccessState([this.bloodList = const[]]);
  
  // [COPY-PASTE] from https://bloclibrary.dev/#/fluttertodostutorial
  @override
  List<Object> get props => [bloodList];
  
  // [DEBUG]
  @override
  String toString() => 'LoadSuccess : { bloodList: $bloodList }';
}

class LoadFailureState extends BloodListState {}
import 'package:equatable/equatable.dart';
import 'package:monstr_app/models/blood.dart';

// TODO: Place `final Blood blood` and canonicalized constructor in base class to reduce redundancy

abstract class BloodListEvent extends Equatable {
  const BloodListEvent();
  
  @override
  List<Object> get props => [];
}

class LoadSuccessEvent extends BloodListEvent {}

// TODO: Brainstorm and implement other potential event types for scalability
// TODO: Add `toString()` methods for debug purposes

class AddedEvent extends BloodListEvent {
  final Blood blood;
  
  const AddedEvent(this.blood);
  
  @override
  List<Object> get props => [blood];
}

class UpdatedEvent extends BloodListEvent {
  final Blood blood;
  
  const UpdatedEvent(this.blood);
  
  @override
  List<Object> get props => [blood];
}

class DeletedEvent extends BloodListEvent {
  final Blood blood;
  
  const DeletedEvent(this.blood);
  
  @override
  List<Object> get props => [blood];
}
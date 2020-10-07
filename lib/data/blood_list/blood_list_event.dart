import 'package:monstr_app/models/blood.dart';

abstract class BloodListEvent  {
  const BloodListEvent();
}

class LoadSuccessEvent extends BloodListEvent {}

// TODO: Brainstorm and implement other potential event types for scalability
// TODO: Add `toString()` methods for debug purposes

class AddedEvent extends BloodListEvent {
  final Blood blood;
  
  const AddedEvent(this.blood);
}

class UpdatedEvent extends BloodListEvent {
  final Blood blood;
  
  const UpdatedEvent(this.blood);
}

class DeletedEvent extends BloodListEvent {
  final Blood blood;
  
  const DeletedEvent(this.blood);
}
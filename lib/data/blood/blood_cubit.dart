import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'blood_state.dart';

class BloodCubit extends Cubit<BloodState> {
  BloodCubit() : super(BloodInitial());
}

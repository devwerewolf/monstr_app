import 'package:bloc/bloc.dart';

class BloobCubit extends Cubit<bool> {
  BloobCubit() : super(false);
  
  void toggle() => emit(!state);
}
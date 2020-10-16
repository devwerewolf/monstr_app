import 'package:bloc/bloc.dart';

class MonstrObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
  
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }
}
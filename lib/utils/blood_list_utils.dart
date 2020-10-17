import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

BlocBuilder renderBloodList({Widget child}) {
  return BlocBuilder<BloodListBloc, BloodListState>(
    builder: (context, state) {
      switch (state.runtimeType) {
        case LoadSuccessState:
          var bloodList = (state as LoadSuccessState).bloodList;
          return child;
      }
    },
  );
}

// ---------------------

class BloodListRender extends StatefulWidget {
  final Function(List<Blood> bloodList) render;
  
  BloodListRender({@required this.render});
  
  @override
  _BloodListRenderState createState() => _BloodListRenderState();
}

class _BloodListRenderState extends State<BloodListRender> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BloodListBloc, BloodListState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadSuccessState:
            var bloodList = (state as LoadSuccessState).bloodList;
            return widget.render(bloodList);
          default:
            return Container();
        }
      },
    );
  }
}
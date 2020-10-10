import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/data/blood_list.dart';
import 'package:monstr_app/pages/home_page/panel.dart';
import 'package:monstr_app/pages/home_page/panel_items/blood_stats.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BloodListBloc, BloodListState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadSuccessState:
            // SURVIVAL
            var bloodList = (state as LoadSuccessState).bloodList.toList();
            var chosenBloodList = bloodList.where((blood) => blood.chosen).toList();
            var bloodStatsList = chosenBloodList.map((bloodElement) => BloodStats(blood: bloodElement)).toList();
            
            return Scaffold(
              body: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Panel>[
                    // TODO: Panel data array
                    Panel(
                      route: '/cosmos',
                      items: [],
                    ),
                    Panel(
                      route: '/love',
                      items: [],
                    ),
                    Panel(
                      route: '/survival',
                      items: [
                        ...bloodStatsList,
                      ],
                    ),
                  ],
                ),
              ),
            );
          default:
            // TODO: Load the bloodList properly for production purposes
            BlocProvider.of<BloodListBloc>(context).add(LoadSuccessEvent());
            return Container();
        }
      },
    );
  }
}
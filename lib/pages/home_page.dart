import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/data/blood_list.dart';
import 'package:monstr_app/design/panel.dart';
import 'package:monstr_app/components/blood_stats.dart';

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
              body: Center(
                child: Column(
                  // TODO: Figure out if alignment supercedes the need for a Center component
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Panel>[
                    // TODO: Panel data array
                    Panel(
                      route: '/cosmos',
                      color: Colors.purple,
                      items: [],
                    ),
                    Panel(
                      route: '/love',
                      color: Colors.green,
                      items: [],
                    ),
                    Panel(
                      // TODO: Make the title dynamic for different food/transform types?
                      route: '/survival',
                      color: Colors.orange,
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
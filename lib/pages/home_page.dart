import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/data/blood_list.dart';
import 'package:monstr_app/design/panel_list.dart';
import 'package:monstr_app/components/blood_stats.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            PanelList(
              route: '/cosmos',
              color: Colors.purple,
              // items: bloodStatsList,
            ),
            PanelList(
              route: '/love',
              color: Colors.green,
              // items: bloodStatsList,
            ),
            BlocBuilder<BloodListBloc, BloodListState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case LoadSuccessState:
                    var bloodList = (state as LoadSuccessState).bloodList.toList();
                    var chosenBloodList = bloodList.where((blood) => blood.chosen).toList();
                    var bloodStatsList = chosenBloodList.map((bloodElement) => BloodStats(blood: bloodElement)).toList();
                      
                    return PanelList(
                      route: '/survival',
                      color: Colors.orange,
                      items: bloodStatsList,
                    );
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
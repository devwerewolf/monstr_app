import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/data/blood/blood_cubit.dart';

class BloodPanelItem extends StatelessWidget {
  const BloodPanelItem({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BloodCubit(),
      child: null,
    );
  }
}
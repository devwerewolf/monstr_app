import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstr_app/data/blood_list/blood_list_bloc.dart';
import 'package:monstr_app/data/monstr_observer.dart';

import 'package:monstr_app/pages/cosmos_page.dart';
import 'package:monstr_app/pages/home_page.dart';
import 'package:monstr_app/pages/love_page.dart';
import 'package:monstr_app/pages/survival_page.dart';
import 'package:monstr_app/utils/blood_list_utils.dart';

void main() {
  Bloc.observer = MonstrObserver();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BloodListBloc(),),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initBloodList(context);
    
    SystemChrome.setEnabledSystemUIOverlays([]);
    
    return MaterialApp(
      title: 'Monstr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/cosmos': (context) => CosmosPage(),
        '/love': (context) => LovePage(),
        '/survival': (context) => SurvivalPage(),
      },
      initialRoute: '/',
    );
  }
}

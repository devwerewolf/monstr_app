// Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:monstr_app/data/monstr_observer.dart';

// Components
import 'package:monstr_app/pages/cosmos_page.dart';
import 'package:monstr_app/pages/home_page.dart';
import 'package:monstr_app/pages/love_page.dart';
import 'package:monstr_app/pages/survival_page.dart';

void main() {
  Bloc.observer = MonstrObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

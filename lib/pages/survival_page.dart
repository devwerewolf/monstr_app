import 'package:flutter/material.dart';
import 'package:monstr_app/components/blood_group.dart';

class SurvivalPageProps {
  final bool hasBlood;
  
  SurvivalPageProps({this.hasBlood = true});
}

class SurvivalPage extends StatefulWidget {
  @override
  _SurvivalPageState createState() => _SurvivalPageState();
}

class _SurvivalPageState extends State<SurvivalPage> {
  
  @override
  Widget build(BuildContext context) {
    final SurvivalPageProps routeProps = ModalRoute.of(context).settings.arguments;
    
    List<Widget> foodGroups = [];
    
    if (routeProps.hasBlood) {
      foodGroups.add(BloodGroup());
    }
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.orange),
        child: Column(
          children: foodGroups,
        ),
      ),
    );
  }
}
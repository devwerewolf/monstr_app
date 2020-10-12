import 'package:flutter/material.dart';
import 'package:monstr_app/components/blood_group.dart';

// TODO: Do I need SurvivalPageProps anymore? Do routes need params right now?
class SurvivalPageProps {
  final bool hasBlood;
  
  SurvivalPageProps({this.hasBlood = false});
}

class SurvivalPage extends StatefulWidget {
  @override
  _SurvivalPageState createState() => _SurvivalPageState();
}

class _SurvivalPageState extends State<SurvivalPage> {
  
  @override
  Widget build(BuildContext context) {
    // final SurvivalPageProps routeProps = ModalRoute.of(context).settings.arguments;
    
    // // TODO: Arrange foodGroups in the user's preferred order
    // List<Widget> foodGroups = [];
    
    // if (routeProps.hasBlood) {
    //   foodGroups.add(BloodGroup());
    // }
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.orange),
        child: Column(
          children: [
            BloodGroup(),
            BloodGroup(),
            BloodGroup(),
          ],
        ),
      ),
    );
  }
}
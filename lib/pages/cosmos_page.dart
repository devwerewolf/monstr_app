import 'package:flutter/material.dart';
import 'package:monstr_app/components/primary_page_container.dart';
import 'package:monstr_app/constants/custom_theme.dart';

class CosmosPage extends StatefulWidget {
  @override
  _CosmosPageState createState() => _CosmosPageState();
}

class _CosmosPageState extends State<CosmosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryPageContainer(
        borderColor: CosmosPageBorderColor,
        child: null
      )
    );
  }
}
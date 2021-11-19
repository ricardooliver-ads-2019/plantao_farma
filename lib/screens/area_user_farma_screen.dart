// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AreaUserFarmaScreen extends StatefulWidget {
  const AreaUserFarmaScreen({ Key? key }) : super(key: key);

  @override
  _AreaUserFarmaScreenState createState() => _AreaUserFarmaScreenState();
}

class _AreaUserFarmaScreenState extends State<AreaUserFarmaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Area Farmacia'),),
      body: Container(
        color: Colors.pink,
      ),
      
    );
  }
}
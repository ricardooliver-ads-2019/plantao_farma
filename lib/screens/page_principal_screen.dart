// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:plantao_farma/components/app_bar_c.dart';
import 'package:plantao_farma/components/farmacia_grid.dart';
import 'package:plantao_farma/components/navigator_bar.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/provides/services/firestore_service.dart';
import 'package:provider/provider.dart';
import 'package:timer_builder/timer_builder.dart';

class PagePrincipalScreen extends StatefulWidget {
  const PagePrincipalScreen({ Key? key }) : super(key: key);

  @override
  _PagePrincipalScreenState createState() => _PagePrincipalScreenState();
}

class _PagePrincipalScreenState extends State<PagePrincipalScreen> {
  @override
  Widget build(BuildContext context) {
  FirestoreService firestore = Provider.of<FirestoreService>(context);
   final List<Farmacia> farmacia = firestore.list;
    return TimerBuilder.periodic(
      Duration(minutes: 1),
      builder: (context){
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppBarC(),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height-284,
                  child: ListView.builder(
                    itemCount: farmacia.length,
                    itemBuilder: (_, index){
                      return FarmaciaGrid(farmacia: farmacia[index]);
                    }
                  ),
                ),
                NavigatorBar(),
              ],
            ),
          )
        )
      );
      },
    );
  }
  
}
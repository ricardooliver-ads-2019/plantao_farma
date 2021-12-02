// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plantao_farma/components/app_bar_c.dart';
import 'package:plantao_farma/components/farmacia_grid.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/provides/services/firestore_service.dart';
import 'package:provider/provider.dart';

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
                height: MediaQuery.of(context).size.height-235,
                child: ListView.builder(
                  itemCount: farmacia.length,
                  itemBuilder: (_, index){
                    return FarmaciaGrid(farmacia: farmacia[index]);
                  }
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
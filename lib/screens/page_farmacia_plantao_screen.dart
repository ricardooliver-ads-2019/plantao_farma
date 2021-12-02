// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plantao_farma/components/app_bar_c.dart';
import 'package:plantao_farma/components/farmacia_grid.dart';
import 'package:plantao_farma/components/navigator_bar.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/provides/services/firestore_service.dart';
import 'package:provider/provider.dart';

class PageFarmaciaPlantaoScrenn extends StatefulWidget {
  const PageFarmaciaPlantaoScrenn({ Key? key }) : super(key: key);

  @override
  _PageFarmaciaPlantaoScrennState createState() => _PageFarmaciaPlantaoScrennState();
}

class _PageFarmaciaPlantaoScrennState extends State<PageFarmaciaPlantaoScrenn> {
  @override
  Widget build(BuildContext context) {
  FirestoreService firestore = Provider.of<FirestoreService>(context);
   final List<Farmacia> farmacia = firestore.listFarmaPlantao;
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
  }
}
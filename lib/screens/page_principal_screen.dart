// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plantao_farma/components/app_bar_c.dart';
import 'package:plantao_farma/components/farmacia_grid.dart';
import 'package:plantao_farma/mocks/mock_farmacias.dart';
import 'package:plantao_farma/models/farmacia.dart';

class PagePrincipalScreen extends StatefulWidget {
  const PagePrincipalScreen({ Key? key }) : super(key: key);

  @override
  _PagePrincipalScreenState createState() => _PagePrincipalScreenState();
}

class _PagePrincipalScreenState extends State<PagePrincipalScreen> {
  final List<Farmacia> farmacia = MockFarmacias;
  @override
  Widget build(BuildContext context) {
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
                height: MediaQuery.of(context).size.height-215,
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
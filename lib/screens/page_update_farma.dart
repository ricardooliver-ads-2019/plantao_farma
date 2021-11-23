// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/app_routes.dart';
import 'package:plantao_farma/components/form_update_farma.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/utils/app_color.dart';

class PageUpdateFarma extends StatefulWidget {
  const PageUpdateFarma({ Key? key, required this.farmacia }) : super(key: key);
  final Farmacia farmacia;
  @override
  _PageUpdateFarmaState createState() => _PageUpdateFarmaState();
}

class _PageUpdateFarmaState extends State<PageUpdateFarma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Atualizar de Farmacias', 
          style: GoogleFonts.oswald(
            color: AppColor.bgColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),          
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap:(){Navigator.of(context).pushReplacementNamed(AppRoutes.AREA_ADM);},
          child: Icon(Icons.arrow_back)
        ),
          
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormUpdateFarma(farmacia: widget.farmacia,),
          ],
        ),
        
      ),
    );
  }
}
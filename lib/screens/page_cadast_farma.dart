// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/app_routes.dart';
import 'package:plantao_farma/utils/app_color.dart';
class PageCadastFarma extends StatefulWidget {
  const PageCadastFarma({ Key? key }) : super(key: key);

  @override
  _PageCadastFarmaState createState() => _PageCadastFarmaState();
}

class _PageCadastFarmaState extends State<PageCadastFarma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Cadastro de Farmacias', 
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
          children: [],
        ),
        
      ),
    );
  }
}
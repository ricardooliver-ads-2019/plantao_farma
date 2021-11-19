// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/app_routes.dart';
import 'package:plantao_farma/utils/app_color.dart';

class AreaADMScreen extends StatefulWidget {
  const AreaADMScreen({ Key? key }) : super(key: key);

  @override
  _AreaADMScreenState createState() => _AreaADMScreenState();
}

class _AreaADMScreenState extends State<AreaADMScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Are ADM',
            style: GoogleFonts.oswald(
              color: AppColor.bgColor,
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          centerTitle: true,
          toolbarHeight: 110,
          backgroundColor: AppColor.primaryColor,
          leading: GestureDetector(
            onTap:(){Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);},
            child: Icon(Icons.arrow_back)
          ),
          
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(AppRoutes.CADASTRAR_FARMACIA);
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.cyanAccent.shade100),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.add_business, size: 30, color: AppColor.primaryColor),
                        SizedBox(
                          width: 10,
                        ),
                        Text("CADASTRAR NOVA FARMACIA", 
                          style: GoogleFonts.nunito(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
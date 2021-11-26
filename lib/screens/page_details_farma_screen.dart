// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';
class PageDetailsFarmaScreen extends StatefulWidget {
  const PageDetailsFarmaScreen({ Key? key, required this.farmacia }) : super(key: key);
  final Farmacia farmacia;

  @override
  _PageDetailsFarmaScreenState createState() => _PageDetailsFarmaScreenState();
}

class _PageDetailsFarmaScreenState extends State<PageDetailsFarmaScreen> {
   @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 5));
  }
  @override
  Widget build(BuildContext context) {
    //FirestoreService firestore = Provider.of<FirestoreService>(context);
    //final Farmacia farmacia = firestore.listDetailFarma[0];
    var telaWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bgColor,
          title: Text(widget.farmacia.nome),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: telaWidth * 0.92,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image:  NetworkImage('https://i.glbimg.com/og/ig/infoglobo1/f/original/2020/08/31/pague_menos.jpg'), fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: telaWidth * 0.92,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Center(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: AppColor.bgColor),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(child: Icon(Icons.phone, size: 30 ,color: AppColor.primaryColor,))
                                ),
                              ),
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                            Column(
                              children: [
                                Text('69 - 99999-4599', 
                                  style: GoogleFonts.oswald(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )
                          ], 
                        ),

                        SizedBox(
                          width: 15,
                        ),

                        Column(
                          children: [
                            Container(
                              child: Center(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: AppColor.bgColor),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(child: Icon(Icons.add_shopping_cart_rounded ,  size: 30 ,color: AppColor.primaryColor,))
                                ),
                              ),
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                            Text('Disk - Pedidos', 
                              style: GoogleFonts.oswald(
                                fontSize: 14,
                              ),
                            )
                          ], 
                        ),

                        SizedBox(
                          width: 15,
                        ),

                        Column(
                          children: [
                            Container(
                              child: Center(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: AppColor.bgColor),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(child: Icon(Icons.phone, size: 30 ,color: AppColor.primaryColor,))
                                ),
                              ),
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                            Text('69 - 99999-4599', 
                              style: GoogleFonts.oswald(
                                fontSize: 14,
                              ),
                            )
                          ], 
                        ),

                        SizedBox(
                          width: 15,
                        ),

                        Column(
                          children: [
                            Container(
                              child: Center(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: AppColor.bgColor),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(child: Icon(Icons.phone, size: 30 ,color: AppColor.primaryColor,))
                                ),
                              ),
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                            Text('69 - 99999-4599', 
                              style: GoogleFonts.oswald(
                                fontSize: 14,
                              ),
                            )
                          ], 
                        ),


                        SizedBox(
                          width: 15,
                        ),


                        Column(
                          children: [
                            Container(
                              child: Center(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: AppColor.bgColor),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(child: Icon(Icons.phone, size: 30 ,color: AppColor.primaryColor,))
                                ),
                              ),
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                            Text('69 - 99999-4599', 
                              style: GoogleFonts.oswald(
                                fontSize: 14,
                              ),
                            )
                          ], 
                        ),

                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage(AppAssets.imgMaps), fit: BoxFit.fill),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Endereço: Novo Horizonte, N° 1799",
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                //color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                           
                            Text('Bairro: St. 03',
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                //color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            
                            Text('Cidade: Ariquemes-RO',
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                //color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            
                            Text('CEP: 76870-042',
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                //color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                             SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: AppColor.bgColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Icon(Icons.phone, size: 30 ,color: AppColor.primaryColor,))
                          ),
                        ),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFCCCCCC),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("(69) - 3536-3536",
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                //color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                           
                            Text("(69) - 99245-9295",
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                //color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            
                            Text("(69) - 98445-1253",
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                //color: Colors.grey.withOpacity(0.5),
                              ),
                            ),

                            Text("(69) - 99902-0501",
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                //color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
      
                          ],
                        ),
                      ),
                      
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
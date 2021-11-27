// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';
class PageDetailsFarmaScreen extends StatefulWidget {
  const PageDetailsFarmaScreen({ Key? key, required this.farmacia, required this.on_off }) : super(key: key);
  final Farmacia farmacia;
  final bool on_off;

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
          title: Text(widget.farmacia.nome, 
            style: GoogleFonts.oswald(
              color: AppColor.primaryColor,
              fontSize: 24
            ),
          ),
          leading: Center(
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  border: Border.all(width: 1, color: Colors.white.withOpacity(0.05)),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    //BoxShadow(
                      //color: Colors.grey.withOpacity(0.15),
                      //spreadRadius: 0,
                      //blurRadius: 2,
                      //offset: Offset(30.0, 30.0)
                    //)
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 15,),
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 100,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: telaWidth * 0.92,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image:  NetworkImage('https://i.glbimg.com/og/ig/infoglobo1/f/original/2020/08/31/pague_menos.jpg'), fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: widget.on_off 
                          ? Text('Aberto', style: GoogleFonts.oswald(
                            fontSize: 20,
                            color: Colors.greenAccent,
                          ))
                          : Text('Fechado', style: GoogleFonts.oswald(
                            fontSize: 20,
                            color: AppColor.primaryColor,
                          ),),
                        ),
                      )
                    ],                    
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 180,
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
                                  child: Center(child: Image(image: AssetImage(AppAssets.iconPhone),width: 30,)),
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
                                  child: Center(child: Icon(Icons.add_shopping_cart_rounded, size: 30, color: AppColor.primaryColor)),
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
                                  child: Center(child: Image(image: AssetImage(AppAssets.iconWhatsapp),width: 30,)),
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
                                  child: Center(child: Image(image: AssetImage(AppAssets.iconRelogio),width: 30,)),
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
                                Text('Horario', 
                                  style: GoogleFonts.oswald(
                                    fontSize: 14,
                                  ),
                                ),
                                Text('(07:30) ás (21:30)', 
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

                  SizedBox(
                    height: 40,
                  ),

                  Container(
                    height: 60,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50),

                    ),
                    child: Center(
                      child: Image(image: AssetImage(AppAssets.iconPedido), width: 40,),
                    ),
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
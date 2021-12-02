// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_collection_literals

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plantao_farma/components/farma_detalhes_maps.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';
import 'package:plantao_farma/utils/link_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';
class PageDetailsFarmaScreen extends StatefulWidget {
  const PageDetailsFarmaScreen({ Key? key, required this.farmacia, required this.on_off }) : super(key: key);
  final Farmacia farmacia;
  final bool on_off;

  @override
  _PageDetailsFarmaScreenState createState() => _PageDetailsFarmaScreenState();
}

class _PageDetailsFarmaScreenState extends State<PageDetailsFarmaScreen> {
  late GoogleMapController _mapsController;
  get mapsController => _mapsController;
  final appKey = GlobalKey();
  

  Set<Marker> markes = Set<Marker>();

  void onMapCreated(GoogleMapController gms) async{
    _mapsController = gms;
    loadFarmacia();
  }

  loadFarmacia(){
    markes.add(
      Marker(
        markerId: MarkerId(widget.farmacia.nome),
        position: LatLng(-9.916206238799434, -63.03447574686395),
        infoWindow: InfoWindow(
          title: widget.farmacia.nome,
        ),
        onTap:(){
          showModalBottomSheet(context: context, builder: (context) => FarmaDetalhes(farmacia: widget.farmacia));
        }
      )
    );
  }


  launchApp(String url, BuildContext context)async{
    await canLaunch(url)? await launch(url):showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Alert!'),
        content: Text('Não foi possível encontrar um App compatível.'),
      );
    });
  }

  @override
  void initState(){
    loadFarmacia();
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
                          image: DecorationImage(image:  NetworkImage(widget.farmacia.logo), fit: BoxFit.fill),
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
                            GestureDetector(
                              onTap: (){
                                launchApp('tel:${widget.farmacia.telefone}', context);
                              },
                              child: Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Telefone', 
                                        style: GoogleFonts.oswald(
                                          fontSize: 14,
                                          color: AppColor.bgColor,
                                          fontWeight: FontWeight.bold,
                                        )
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: AppColor.bgColor),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(child: Image(image: AssetImage(AppAssets.iconPhone),width: 30,)),
                                      ),
                                    ],
                                  ),
                                ),
                                height: 120,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.3),
                                  //color: Color(0xFFCCCCCC),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(widget.farmacia.telefone, 
                                  style: GoogleFonts.oswald(
                                    color: AppColor.primaryColor,
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
                            GestureDetector(
                              onTap: (){
                                linkWhatsapp(widget.farmacia.whatsapp);
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Disk Pedidos', 
                                      style: GoogleFonts.oswald(
                                        fontSize: 14,
                                        color: AppColor.bgColor,
                                        fontWeight: FontWeight.bold,
                                      )
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: AppColor.bgColor),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(child: Icon(Icons.add_shopping_cart_rounded, size: 30, color: AppColor.primaryColor)),
                                      ),
                                    ),
                                  ],
                                ),
                                height: 120,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.3),
                                  //color: Color(0xFFCCCCCC),
                                ),
                              ),
                            ),
                            Text('Pesça agora', 
                              style: GoogleFonts.oswald(
                                color: AppColor.primaryColor,
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
                            GestureDetector(
                              onTap:(){
                                linkWhatsapp(widget.farmacia.whatsapp);
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Whatsapp', 
                                      style: GoogleFonts.oswald(
                                        fontSize: 14,
                                        color: AppColor.bgColor,
                                        fontWeight: FontWeight.bold,
                                      )
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: AppColor.bgColor),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(child: Image(image: AssetImage(AppAssets.iconWhatsapp),width: 30,)),
                                      ),
                                    ),
                                  ],
                                ),
                                height: 120,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.3),
                                  //color: Color(0xFFCCCCCC),
                                ),
                              ),
                            ),
                            Text(widget.farmacia.whatsapp, 
                              style: GoogleFonts.oswald(
                                color: AppColor.primaryColor,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Funcionamento', 
                                      style: GoogleFonts.oswald(
                                        fontSize: 14,
                                        color: AppColor.bgColor,
                                        fontWeight: FontWeight.bold,
                                      )
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2, color: AppColor.bgColor),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(child: Image(image: AssetImage(AppAssets.iconRelogio),width: 30,)),
                                    ),
                                  ],
                                ),
                              ),
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                            Column(
                              children: [
                                widget.farmacia.plantao ? Text('24horas',
                                  style: GoogleFonts.oswald(
                                    color: AppColor.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                : Text('${widget.farmacia.horarioAbertura} ás ${widget.farmacia.horarioFechamento}', 
                                  style: GoogleFonts.oswald(
                                    color: AppColor.primaryColor,
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

                  GestureDetector(
                    onTap: (){
                      linkWhatsapp(widget.farmacia.whatsapp);
                    },
                    child: Container(
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
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: telaWidth * 0.95,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: AppColor.primaryColor),
                    ),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(-9.916206238799434, -63.03447574686395),
                        zoom: 15.8,                        
                      ),
                      zoomControlsEnabled: true,
                      myLocationEnabled: true,
                      onMapCreated: onMapCreated,
                      markers: markes,
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
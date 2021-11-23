// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations, implementation_imports

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/app_routes.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/provides/services/firestore_service.dart';
import 'package:plantao_farma/screens/page_update_farma.dart';
import 'package:plantao_farma/utils/app_color.dart';
import 'package:provider/src/provider.dart';

class ListFarmaciasAdm extends StatefulWidget {
  const ListFarmaciasAdm({ Key? key, required this.farmacia }) : super(key: key);
  final Farmacia farmacia;
  @override
  _ListFarmaciasAdmState createState() => _ListFarmaciasAdmState();
}

class _ListFarmaciasAdmState extends State<ListFarmaciasAdm> {

  remover()async{
    try{
      await context.read<FirestoreService>().remove(widget.farmacia);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Icon(Icons.check, size: 50, color: Colors.green))));
    } on FirestoreExceptions catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(            
              width: 110,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                image: DecorationImage(image: AssetImage(widget.farmacia.logo), fit: BoxFit.fill)
              ),
            ),
            
            Expanded(
              child: Container(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("${widget.farmacia.nome}", style: GoogleFonts.oswald(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('CNPJ - ${widget.farmacia.cnpj}', style: GoogleFonts.oswald(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                        ),                      
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: Icon(Icons.control_point_outlined, size: 50, color: AppColor.primaryColor),
                              onTap:(){}
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              child: Icon(Icons.edit_rounded, size: 50, color: AppColor.primaryColor),
                              onTap:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> PageUpdateFarma(farmacia: widget.farmacia)));
                              }
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              child: Icon(Icons.delete_forever, size: 50, color: AppColor.primaryColor),
                              onTap:(){
                                remover();
                              }
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),    
          ],
        ),
      ),
    );
  }
}
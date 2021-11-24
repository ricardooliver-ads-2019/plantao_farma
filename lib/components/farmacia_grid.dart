// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';

class FarmaciaGrid extends StatefulWidget {
  const FarmaciaGrid({ Key? key, required this.farmacia }) : super(key: key);
  final Farmacia farmacia;
  @override
  _FarmaciaGridState createState() => _FarmaciaGridState();
}

class _FarmaciaGridState extends State<FarmaciaGrid> {
  @override
  Widget build(BuildContext context) {
    TimeOfDay horaAtual = TimeOfDay.now();
    int horaAtu = horaAtual.hour *60 + horaAtual.minute;
    TimeOfDay horaFechamento = TimeOfDay(hour: widget.farmacia.horarioF[0], minute: widget.farmacia.horarioF[1]);
    int horaFech = horaFechamento.hour * 60 + horaFechamento.minute;
    TimeOfDay horaAbertura = TimeOfDay(hour: widget.farmacia.horarioA[0], minute: widget.farmacia.horarioA[1]);
    int horaAber = horaAbertura.hour * 60 + horaAbertura.minute;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(10)
        ),
        child: GestureDetector(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.farmacia.nome}", 
                        style: GoogleFonts.oswald(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 15),
                            Text("Horario de Funcionamento", style: GoogleFonts.oswald(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("${widget.farmacia.horarioAbertura} - ${widget.farmacia.horarioFechamento}", style: GoogleFonts.oswald(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                       Expanded(
                         child: Container(
                           color: Colors.grey.withOpacity(0.2),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Image.asset((horaAber <= horaAtu) & (horaAtu < horaFech) ? AppAssets.buttonON : AppAssets.buttonOFF, width: 70,),
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
          onTap: (){},
        ),
      ),
    );
  }
}
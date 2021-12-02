// ignore_for_file: file_names, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/utils/app_color.dart';
class FarmaDetalhes extends StatelessWidget {
  Farmacia farmacia;
  FarmaDetalhes({Key? key, required this.farmacia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            farmacia.logo, 
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Padding(padding: EdgeInsets.only(top: 24, left: 24),
            child: Text(farmacia.nome, 
              style: GoogleFonts.oswald(
                fontSize: 24,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10, left: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Endereço: ${farmacia.endereco}', 
                  style: GoogleFonts.oswald(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('Bairro: ${farmacia.bairro}', 
                  style: GoogleFonts.oswald(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),            
                Text('CEP: ${farmacia.cep}', 
                  style: GoogleFonts.oswald(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('Cidade: ${farmacia.cidade}/${farmacia.uf}', 
                  style: GoogleFonts.oswald(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
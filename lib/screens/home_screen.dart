// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/app_routes.dart';
import 'package:plantao_farma/provides/services/auth_service.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //var telaHeight = MediaQuery.of(context).size.height;
    AuthService authProvider = Provider.of<AuthService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.titleG,width: 270,),
            Image.asset(AppAssets.logo, width: 160,),
            Text("\"Tenha todas as farmacias na palma de sua mão\"",
              style: GoogleFonts.oswald(
                color: AppColor.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
                wordSpacing: 0.5,
              ),
              textAlign: TextAlign.center,

              
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(AppRoutes.PAGEPRINCIAL);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Encontrar Farmacias", 
                    style: GoogleFonts.nunito(
                      color: AppColor.bgColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    //print(authProvider.usuario);
                    Navigator.of(context).pushNamed(AppRoutes.LOGIN);

                  },
                  child: Text("AREA - ADM", 
                    style: GoogleFonts.nunito(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                      //wordSpacing: 0.5,
                    ),

                    textAlign: TextAlign.right,
                  )
                ),
                SizedBox(
                  width: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Definicoes {
}
// ignore_for_file: prefer_const_constructors, unused_local_variable, must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:plantao_farma/app_routes.dart';
import 'package:plantao_farma/provides/services/auth_service.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  getLocationUser()async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    //print(_locationData);
  }
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
                  onTap: ()async{
                    //print(authProvider.usuario);
                    Navigator.of(context).pushNamed(AppRoutes.LOGIN);
                    await getLocationUser();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3)
                    ),
                    child: Image(image: AssetImage(AppAssets.iconAreaADM), width: 30,),
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
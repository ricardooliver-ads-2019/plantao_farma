// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import '../app_routes.dart';

class NavigatorBar extends StatelessWidget {
  const NavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Image(image: AssetImage(AppAssets.iconFarmacias), width: 35,),
            onTap:(){
              Navigator.of(context).pushReplacementNamed(AppRoutes.PAGEPRINCIAL);
            },
          ),
          //GestureDetector(
          //  child: Icon(Icons.admin_panel_settings, size: 35, color: AppColor.primaryColor),
          //  onTap:(){
          //    Navigator.of(context).pushNamed(AppRoutes.LOGIN);
          //  },
          //),
          GestureDetector(
            child: Image(image: AssetImage(AppAssets.iconFarmacias24h), width: 35,),
            onTap:(){
              Navigator.of(context).pushNamed(AppRoutes.PAGEFARMACIASDEPLANTAO);
            },
          ),
          
        ],
      ),

    );
  }
}
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';


class AppBarC extends StatefulWidget {
  const AppBarC({Key? key}) : super(key: key);

  @override
  State<AppBarC> createState() => _AppBarCState();
}

class _AppBarCState extends State<AppBarC> {
  final _buscar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            GestureDetector(
              onTap:(){Navigator.of(context).pop();},
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(Icons.arrow_back, size: 30, color: AppColor.bgColor)
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(AppAssets.titleWhite, height: 70,)
            ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.place_outlined, color: AppColor.bgColor),
                SizedBox(
                  width: 5,
                ),
                Text("Ariquemes-RO", 
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  fontWeight: FontWeight.normal
                ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            child: TextFormField(
              controller: _buscar,
              onChanged: (value){},
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: (){},
                  child: Icon(Icons.search, size: 30,)
              ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.bgColor)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.bgColor)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
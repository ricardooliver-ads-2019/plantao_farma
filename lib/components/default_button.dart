// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/utils/app_color.dart';


class DefaultButton extends StatelessWidget {
   DefaultButton({
    Key ?key,
    required this.imageSrc,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String imageSrc, text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        primary: AppColor.bgColor,
        padding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 20,
      ),
      ),
      
      
      onPressed: (){
        //print("Hello World");
        press();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 2,child: Image.asset(imageSrc, height: 30)),
          //Expanded(flex: 0, child: SizedBox(width: 10)),
          Expanded(
            flex: 3,
            child: Text(text, 
              style: GoogleFonts.oswald(
                color: AppColor.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.normal
              ),
            )
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:plantao_farma/app_routes.dart';
import 'package:plantao_farma/utils/app_assets.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((_) => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME));
  }

  @override
  Widget build(BuildContext context) {
    var telaWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 250,
                      width: telaWidth,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.only(bottomRight: Radius.circular(telaWidth),),
                        color: Colors.red,    
                      ),
                    ),
                    Image.asset(AppAssets.title),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    AnimatedCard(
                      direction: AnimatedCardDirection.left,
                      duration: Duration(seconds: 2),
                      child: Center(child: Image(image: AssetImage(AppAssets.logo), width: 100,))),
        
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: SizedBox(
                        width: 50,
                        height: 10,
                        child: LoadingIndicator(
                            indicatorType: Indicator.ballBeat, /// Required, The loading type of the widget
                            colors: const [Colors.red],       /// Optional, The color collections
                            strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                            //backgroundColor: Colors.black,      /// Optional, Background of the widget
                            //pathBackgroundColor: Colors.green   /// Optional, the stroke backgroundColor
                        ),
                      ),
                    ),
    
    
        
                  ],
                ),
                
        
            ],
          ),
        ),
      ),
    );
  }
}
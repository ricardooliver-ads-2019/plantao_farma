// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plantao_farma/provides/services/auth_service.dart';
import 'package:plantao_farma/screens/area_adm_screen.dart';
import 'package:plantao_farma/screens/login_screen.dart';
import 'package:provider/provider.dart';
class AuthCheck extends StatefulWidget {
  const AuthCheck({ Key? key }) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    }else if(auth.usuario == null){
      //print(auth.usuario);
      return LoginScreen();
    }else{
      //print(auth.usuario);
      return AreaADMScreen();
    }
  }

  loading(){
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}
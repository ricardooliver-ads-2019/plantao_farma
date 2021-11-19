// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, non_constant_identifier_names, implementation_imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/provides/services/auth_service.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';
import 'package:provider/src/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../app_routes.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  var _loginC = TextEditingController();
  var _passwordC = TextEditingController();
  var visible = true;

  login()async{
    try{
      await context.read<AuthService>().login(_loginC.text, _passwordC.text);
      Navigator.of(context).pushReplacementNamed(AppRoutes.AUTHCHECK);
    } on AuthException catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }


  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 110,
          backgroundColor: AppColor.primaryColor,
          leading: GestureDetector(
            onTap:(){
              context.read<AuthService>().logout();
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
            child: Icon(Icons.arrow_back)
          ),
          title: Text('Are Exclusiva para Administradores',
            style: GoogleFonts.oswald(
              color: AppColor.bgColor,
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image.asset(AppAssets.title),
                      SizedBox(
                        height: 40,
                      ),
                      Text('Entrar', 
                        style: GoogleFonts.oswald(
                          color: AppColor.primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      TextFormField(  
                        controller: _loginC,
                        onChanged: (value){},
                        style: TextStyle(color: AppColor.primaryColor),
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.primaryColor)),
                            prefixIcon: Icon(Icons.person_sharp,color: AppColor.primaryColor,size: 30,),
                            labelText: "Login",
                            hintText: "Digite login do usuario",
                            hintStyle: TextStyle(color: AppColor.primaryColor),
                            labelStyle: TextStyle(color: AppColor.primaryColor),
                          ),
                        validator: Validatorless.multiple([
                          Validatorless.required('Informe login do usuario!'),
                          Validatorless.email('Email Inválido!'),
                        ])
                        
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        obscureText: visible,
                        obscuringCharacter: '*',  
                        controller: _passwordC,
                        onChanged: (value){},
                        style: TextStyle(color: AppColor.primaryColor),
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.primaryColor)),
                            prefixIcon: Icon(Icons.vpn_key_sharp, color: AppColor.primaryColor,size: 30,),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                                child: visible ? Icon(Icons.visibility_off, size: 30,) : Icon(Icons.visibility, size: 30,)
                              ),
                            ),
                            labelText: "Senha",
                            hintText: "Digite a senha do usuario",
                            hintStyle: TextStyle(color: AppColor.primaryColor),
                            labelStyle: TextStyle(color: AppColor.primaryColor),
                          ),
                        validator: Validatorless.multiple([
                          Validatorless.required('Informe login do usuario!'),
                          Validatorless.min(8, 'A senha tem que conter pelo menos 8 digitos!'),
                        ])
                        
                      ),

                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: (){
                          var formValid = _formKey.currentState?.validate() ?? false;
                          if (formValid) {

                            login();
                            
                            // passou pela falidação agora tenho que mandar para tela que corresponde para aquele usuario
                            //if(user == 'userAdm'){
                              //area destinada para usuarios Administradores do App
                            //}else{
                              //area destinada para usuarios farma
                            //}
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          child: Text('LOGIN', 
                            style: GoogleFonts.nunito(
                              color: AppColor.bgColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ), 
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
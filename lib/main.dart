// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantao_farma/app_routes.dart';
import 'package:plantao_farma/provides/services/time_service.dart';
import 'package:plantao_farma/screens/area_adm_screen.dart';
import 'package:plantao_farma/screens/area_user_farma_screen.dart';
import 'package:plantao_farma/screens/home_screen.dart';
import 'package:plantao_farma/screens/login_screen.dart';
import 'package:plantao_farma/screens/page_cadast_farma.dart';
import 'package:plantao_farma/screens/page_principal_screen.dart';
import 'package:plantao_farma/screens/splash_screen.dart';
import 'package:plantao_farma/utils/auth_check.dart';
import 'package:provider/provider.dart';
import 'provides/services/auth_service.dart';
import 'provides/services/firestore_service.dart';


void main() async{
  //await Firebase.initializeApp();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => FirestoreService()),
        ChangeNotifierProvider(create: (context) => TimeService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text(
                'Não foi Possível inicializar o Firebase',
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Plantão Farma',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: AppRoutes.SPLASH,
            routes: {
              AppRoutes.SPLASH: (context) => SplashScreen(),
              AppRoutes.HOME: (context) => HomeScreen(),
              AppRoutes.PAGEPRINCIAL: (context) => PagePrincipalScreen(),
              AppRoutes.AUTHCHECK: (context) => AuthCheck(),
              AppRoutes.LOGIN: (context) => LoginScreen(),
              AppRoutes.AREA_ADM: (context) => AreaADMScreen(),
              AppRoutes.CADASTRAR_FARMACIA: (context) => PageCadastFarma(),
              AppRoutes.AREA_USER_FARMA: (context) => AreaUserFarmaScreen(),
            }
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
      },
    );
  }
  
}


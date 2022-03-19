import 'dart:async';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:firedart/firedart.dart';
import 'package:logger/logger.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:nco_app/screens/main/home.dart';
import 'package:nco_app/services/firebase_auth_service.dart';
import 'package:nco_app/services/utility_services.dart';
import 'styles/colors/colors.dart';

void main() {
  FirebaseAuth.initialize('YOUR-FIREBASE-Web-API-Key', VolatileStore());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  var logger = Logger();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final UtilityService _utilityService = UtilityService();
  bool _isOnline = true;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nco_app',
      theme: ThemeData(
        canvasColor: spaceGray,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff845EC2)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: buttonBack,
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)
              )
          )
        ),
        textTheme: TextTheme(
          // displayLarge: const TextStyle(color: Colors.black),
          // displayMedium: const TextStyle(color: Colors.black),
          // displaySmall: const TextStyle(color: Colors.black),
          headlineLarge: const TextStyle(color: Colors.black),
          // headlineMedium: const TextStyle(color: Colors.black),
          // headlineSmall: const TextStyle(color: Colors.black),
          // titleLarge: const TextStyle(color: Colors.black),
          // titleMedium: const TextStyle(color: Colors.black),
          // titleSmall: const TextStyle(color: Colors.black),
          // bodyLarge: const TextStyle(color: Colors.black),
          // bodyMedium: const TextStyle(color: Colors.black),
          // bodySmall: const TextStyle(color: Colors.black),
          // labelLarge: const TextStyle(color: Colors.black),
          labelMedium: const TextStyle(color: Colors.black),
          // labelSmall: const TextStyle(color: Colors.black),
          headline1: TextStyle(
            color: primaryText
          ),
          headline2: const TextStyle(color: Color.fromARGB(255, 212, 43, 43)),
          headline3: const TextStyle(color: Color.fromARGB(255, 199, 21, 21)),
          headline4: TextStyle(
            color: primaryText,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5
          ),
          headline5: const TextStyle(color: Color.fromARGB(255, 214, 20, 20)),
          headline6: const TextStyle(color: Color.fromARGB(255, 214, 13, 13)),
          subtitle1: TextStyle(
            color: primaryText
          ),
          subtitle2: const TextStyle(color: Colors.black),
          bodyText1: const TextStyle(color: Colors.amber),
          bodyText2: TextStyle(
            color: primaryText,
            fontSize: 16.0
          ),
          caption: const TextStyle(color: Colors.black),
          button: TextStyle(
            color: primaryButtonText,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0
          ),
          overline: const TextStyle(color: Colors.black),
        )
      ),
      home: _isOnline ? Home() : Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.staggeredDotsWave(
                color: color2,
                size: 50.0
              ),
              const SizedBox(height: 30.0,),
              const Text("Connection failed!"),
            ],
          ),
        ),
      ),
    );
  }

  checkConnection() {
    // timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => 
      _utilityService.checkConnectivity().then((value) => {
        if(value != _isOnline) {
          setState(() {
            _isOnline = value;
          })
        }
      });
    // );
  }
}

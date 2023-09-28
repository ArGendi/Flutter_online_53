import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/local/shared_preference.dart';
import 'package:untitled/view/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkStartScreen() async{
    String? email = SharedPref.getEmail();
    if(email != null){
      Navigator.pushReplacementNamed(context, addContactScreenPath);
    }
    else{
        Navigator.pushReplacementNamed(context, loginScreenPath);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(mounted){
      Timer(Duration(seconds: 2), (){
        checkStartScreen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(
        "Splash screen",
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
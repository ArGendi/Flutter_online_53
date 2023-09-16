import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:untitled/view/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      splash: Icon(
        Icons.person,
        size: 50,
      ),
      nextScreen: HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
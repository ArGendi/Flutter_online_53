import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/view/screens/add_contact.dart';
import 'package:untitled/view/screens/contacts_screen.dart';
import 'package:untitled/view/screens/home_screen.dart';
import 'package:untitled/view/screens/login_screen.dart';
import 'package:untitled/view/screens/onboarding_screen.dart';
import 'package:untitled/view/screens/page_one_screen.dart';
import 'package:untitled/view/screens/splash_screen.dart';

class AppRouter{

  static Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/': return MaterialPageRoute(builder: (context) => SplashScreen());
      case loginScreenPath: return MaterialPageRoute(builder: (context) => LoginScreen());
      case addContactScreenPath: return MaterialPageRoute(builder: (context) => AddContactScreen());
      case onboardingPath: return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case homeScreenPath: return MaterialPageRoute(builder: (context) => HomeScreen());
      case pageOnePath: return MaterialPageRoute(builder: (context) => PageOneScreen());
      case contactScreenPath: return MaterialPageRoute(builder: (context) => ContactsScreen());
      
    }
  }
}
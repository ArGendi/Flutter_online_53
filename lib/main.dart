
import 'package:flutter/material.dart';
import 'package:untitled/app_router.dart';
import 'package:untitled/view/screens/add_contact.dart';
import 'package:untitled/view/screens/contacts_screen.dart';
import 'package:untitled/view/screens/home_screen.dart';
import 'package:untitled/view/screens/login_screen.dart';
import 'package:untitled/view/screens/onboarding_screen.dart';
import 'package:untitled/view/screens/splash_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: ContactsScreen(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

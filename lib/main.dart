
import 'package:flutter/material.dart';
import 'package:untitled/app_router.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/local/shared_preference.dart';
import 'package:untitled/providers/counter_provider.dart';
import 'package:untitled/view/screens/add_contact.dart';
import 'package:untitled/view/screens/bottom_navigation_bar_screen.dart';
import 'package:untitled/view/screens/contacts_screen.dart';
import 'package:untitled/view/screens/counter.dart';
import 'package:untitled/view/screens/home_screen.dart';
import 'package:untitled/view/screens/login_screen.dart';
import 'package:untitled/view/screens/onboarding_screen.dart';
import 'package:untitled/view/screens/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  await Hive.initFlutter();
  await Hive.openBox(contactTable);
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterScreen(),
        //onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

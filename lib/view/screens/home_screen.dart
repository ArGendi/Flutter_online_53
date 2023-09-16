import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/view/screens/page_one_screen.dart';
import 'package:untitled/view_model/home_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  HomeViewModel homeViewModel = HomeViewModel();
  double width = 300;
  double height = 300;
  bool isBlack = true;
  double opacity = 0.1;
  bool showContainer = false;
  int x = 50;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInCirc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Container( 
                width: 200,
                height: 200,
                color: isBlack ? Colors.black : Colors.green,
                child: Center(child: Text(
                  "Hero",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
            SizedBox(height: 20,),
            Text(
                "Hello I'm testing hero widget",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: PageOneScreen()));
                },
                child: Text("Go to Page one"),
              ),
              TextButton(
                onPressed: (){
                  controller.forward();

                },
                child: Text("Start animation"),
              ),
          ]
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
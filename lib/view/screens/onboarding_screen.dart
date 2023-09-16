import 'package:flutter/material.dart';
import 'package:untitled/view/screens/pageview_screens/onboarding1.dart';
import 'package:untitled/view/screens/pageview_screens/onboarding2.dart';
import 'package:untitled/view/screens/pageview_screens/onboarding3.dart';

class OnboardingScreen extends StatefulWidget{
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Widget> pages = [OnBoarding1(), OnBoarding2(), OnBoarding3()];
  PageController pageController = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: PageView.builder(
              onPageChanged: (page){
                setState(() {
                  pageIndex = page;
                });
              },
              controller: pageController,
              itemCount: pages.length,
              itemBuilder: (context, index){
                return pages[index];
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i=0; i<pages.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: pageIndex == i? 18 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


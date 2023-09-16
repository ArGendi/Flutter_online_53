import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.yellow
                ),
                SizedBox(height: 20,),
                Text("Ready to start ??"),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, homeScreenPath);
                }, child: Text("Start"))
              ],
            ),
          );
  }
}
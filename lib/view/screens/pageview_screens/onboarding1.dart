import 'package:flutter/material.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.green
                ),
                SizedBox(height: 20,),
                Text("Welcome to our app hope find what you want"),
              ],
            ),
          );
  }
}
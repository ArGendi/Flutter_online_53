import 'package:flutter/material.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.black
                ),
                SizedBox(height: 20,),
                Text("You will find your inspiration in our app"),
              ],
            ),
          );
  }
}
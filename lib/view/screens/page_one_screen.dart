import 'package:flutter/material.dart';

class PageOneScreen extends StatelessWidget {
  const PageOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
              width: 200,
              height: 200,
              color: Colors.green,
              child: Center(child: Text(
                "Hero",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              )),
                        ),
            SizedBox(height: 20,),
              Text("Page one"),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Go back to Home page"),
              ),
            ],
          ),
        ),
    );
  }
}
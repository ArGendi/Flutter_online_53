import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> orders = [1,2,3];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: orders.isNotEmpty,
            child: Text("there are some orders"),
            replacement: Text("There is no orders in list"),
          ),
          Icon(Icons.home),
          SizedBox(height: 10,),
          Text("You are in home"),
          SizedBox(height: 10,),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  radius: 30,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 12,
                  child: Icon(Icons.add, color: Colors.black, ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
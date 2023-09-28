import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Click to add one",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10,),
          Consumer<CounterProvider>(
            builder: ((context, provider, child) {
              return Text(
                '${provider.counter}',
                style: TextStyle(fontSize: 18),
              );
            }),
          ),
          SizedBox(height: 10,),
          TextButton(
            onPressed: (){
              Provider.of<CounterProvider>(context, listen: false).decrement();
            },
             child: Text("Decrement"),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<CounterProvider>(context, listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
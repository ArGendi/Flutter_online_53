import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/models/contact.dart';
import 'package:untitled/models/my_database.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  // List<Contact> contacts = [];
  late MyDataBase db;

  // void getData() async{
  //   await db.initializeDB();
  //   List<Contact> data = await db.getFromDB();
  //   setState(() {
  //     contacts = data;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = MyDataBase();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: db.getFromDB(),
        builder: (context, snapshot){
          var contacts = snapshot.data;
          if(snapshot.connectionState == ConnectionState.waiting){
           return CircularProgressIndicator();
          }
          else{
             return ListView.builder(
              itemCount: contacts!.length,
            itemBuilder: ((context, index) {
              return Column(children: [
                Text(contacts[index].name.toString()),
                Text(contacts[index].phone.toString()),
                SizedBox(height: 10,),
              ],);
            }),
          );
          }
          
        },
      ),
    );
  }
}
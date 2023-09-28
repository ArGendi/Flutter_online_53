import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/contact.dart';
import 'package:untitled/local/my_database.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact> contacts = [];
  late MyDataBase db;
  late Box box;

  void getDataBySQFlite() async{
    await db.initializeDB();
    List<Contact> data = await db.getFromDB();
    setState(() {
      contacts = data;
    });
  }

  void getDataByHive(){
    List<Contact> data =  box.keys.map((key){
      var map = box.get(key);
      Contact newContact = Contact.fromMap(map);
      newContact.id = key;
      return newContact;
    }).toList(); 
    setState(() {
      contacts = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = MyDataBase();
    box = Hive.box(contactTable);
    getDataByHive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
              itemCount: contacts.length,
            itemBuilder: ((context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () async{
                      setState(() {
                        contacts[index].name = "Ahmed";
                      });
                      await box.put(contacts[index].id, contacts[index].toMap());
                    
                    },
                    icon: Icon(Icons.update),
                  ),
                  Column(children: [
                    Text(contacts[index].name.toString()),
                    Text(contacts[index].phone.toString()),
                    SizedBox(height: 10,),
                  ],),
                  IconButton(
                    onPressed: () async{
                      await box.delete(contacts[index].id);
                      setState(() {
                        contacts.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              );
            }),
          ),
    );
  }
}
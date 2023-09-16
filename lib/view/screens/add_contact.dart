import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/contact.dart';
import 'package:untitled/models/my_database.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  Contact contact = Contact();
  late MyDataBase db;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var snackBar = SnackBar(
    backgroundColor: Colors.green,
    content: Text('Contact added'),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = MyDataBase();
    db.initializeDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, contactScreenPath);
        }, icon: Icon(Icons.contact_page))
      ]),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                onSaved: (value){
                  contact.name = value;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Enter your name";
                  }
                  else return null;
                },
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.phone,
                onSaved: (value){
                  contact.phone = value;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Enter your phone number";
                  }
                  else if(value.length != 11){
                    return "Not valid phone number";
                  }
                  else return null;
                },
                decoration: InputDecoration(
                  hintText: "Phone number",
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async{
                  bool valid = formKey.currentState!.validate();
                  if(valid == true){
                    formKey.currentState!.save();
                    await db.insertContactInDB(contact);
                    formKey.currentState!.reset();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                 child: Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
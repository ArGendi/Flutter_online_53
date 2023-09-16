import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/models/contact.dart';

class MyDataBase{
  Future<Database> initializeDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'abdo.db'),
      version: 1,
      onCreate: (db, version){
        db.execute("CREATE TABLE contacts(name TEXT, phone TEXT)");
      }
    );
  }

  Future<void> insertContactInDB(Contact c) async{
    Database db = await initializeDB();
    await db.insert('contacts', c.toMap());
    print("saved succesfully");
  }

  Future<List<Contact>> getFromDB() async{
    Database db = await initializeDB();
    List<Map<String, dynamic>> data = await db.query('contacts'); /// [ {'name' : "abdo", 'phone': "12345777"}, {'name' : "mo", 'phone': "2324244"} ]

    List<Contact> contacts =  data.map((e){
      Contact newContact = Contact.fromMap(e);
      return newContact;
    }).toList();

    return contacts;
  }

}
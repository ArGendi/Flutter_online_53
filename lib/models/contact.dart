class Contact{
  String? name; // abdo
  String? phone; // 01227701988

  Contact(){}
  Contact.fromMap(Map<String, dynamic> map){
    name = map['name'];  
    phone = map['phone'];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      'name': name,
      'phone': phone,
    };
    return map;
  }
}
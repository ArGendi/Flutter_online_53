import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                onSaved: (value){
                  email = value;
                },
                validator: (value){
                  if(!value!.contains("@") || !value.contains(".com")){
                    return 'Invalid email format';
                  }
                  else if(value.length < 6){ return "Wrong format";}
                  else return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    )
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    )
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                 onSaved: (value){
                  password = value;
                },
                validator: (value){
                  if(value!.length < 6){
                    return "Too short password";
                  }
                  else return null;
                },
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    )
                  ),
                  // errorBorder: ,
                  // focusedErrorBorder: ,
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  bool valid = key.currentState!.validate();
                  if(valid == true){
                    key.currentState!.save();
                    print("Email $email");
                    print("Password $password");
                  }
              }, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
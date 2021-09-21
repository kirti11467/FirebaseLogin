import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  Future<void> _createUser() async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.
            createUserWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch(e){
      print("Error: $e");
    }
    catch(e){
      print("Error : $e");
    }
  }

  Future<void> _login() async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch(e){
      print("Error: $e");
    }
    catch(e){
      print("Error : $e");
    }
  }

  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Login Page")
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value){ _email=value;},
                decoration: InputDecoration(hintText: "Enter email", hintStyle: TextStyle( fontSize: 20.0, color: Colors.grey[700]),),
                style: TextStyle( fontSize: 25.0, color: Colors.black87),
              ),
              SizedBox(height: 10.0),
              TextField(
                  onChanged: (value){ _password=value;},
                decoration: InputDecoration(hintText: "Enter password", hintStyle: TextStyle( fontSize: 20.0, color: Colors.grey[700]),),
                style: TextStyle( fontSize: 25.0,  color: Colors.black87),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                      onPressed: _login,
                      child: Text("Login", style: TextStyle( fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.blue[900]),)
                  ),
                  MaterialButton(
                      onPressed: _createUser,
                      child: Text("SignUp", style: TextStyle( fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.blue[900]),)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
}

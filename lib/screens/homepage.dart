import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WELCOME",style: TextStyle( fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.red), ),
            SizedBox(height: 9.0,),
            Text("You have successfully logged in",style: TextStyle( fontSize: 20.0, color: Colors.black87), ),
            SizedBox(height: 9.0,),
            Text("Bit Brothers ",style: TextStyle( fontSize: 25.0, color: Colors.green[900]), ),
            Text("Android app development internship assignment",style: TextStyle( fontSize: 18.0, color: Colors.green[900]), ),
            SizedBox(height: 90.0,),
            Text("click below to logout",style: TextStyle( fontSize: 20.0, color: Colors.black87), ),

            MaterialButton(
                onPressed: () async{
                  await FirebaseAuth.instance.signOut();
                },
                child: Text("Sign out" , style: TextStyle( fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.blue[900]), )
            ),
          ],
        )

      ),
    );
  }
}

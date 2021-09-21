import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/homepage.dart';
import 'package:flutter_firebase/screens/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Landingpage(),
    );

  }
}
class Landingpage extends StatelessWidget {

  final Future<FirebaseApp> _initialization=Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Scaffold(
              body: Center(child: Text("error: ${snapshot.error}"),),
            );

          }
          if(snapshot.connectionState==ConnectionState.done){
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (contex, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;

                  if (user == null) {
                    return Loginpage();
                  }
                  else {
                    return Homepage();
                  }
                }
                return Scaffold(
                  body: Center(child: Text("connecting to the app......"),),
                );
              },
                );
          }


          return Scaffold(
            body: Center(child: Text("connecting to the app......"),),
          );

        }
    );
  }
}

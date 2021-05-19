
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tenvotive/HomeScreen.dart';
import 'package:tenvotive/LoginScreen.dart';
import 'package:tenvotive/firebase_repository/repository.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  )
);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 FirebaseRepository _repository = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
      WidgetsFlutterBinding.ensureInitialized();
   // Firestore.instance.collection("users").document().setData({"name":"nkr_programmer"});
    return  MaterialApp(
        title:"Chromser",
        debugShowCheckedModeBanner: false,
     
theme: ThemeData(brightness: Brightness.dark),
        home: FutureBuilder(future:  _repository.getCurrentUser(), 
        builder:(context, AsyncSnapshot<FirebaseUser> snapshot) {  
          if(snapshot.hasData)
          {return Normal();}
          else
          {return HomePage();}
// when current user is clicked if null then loginscreen else homescreen
        },)
      );
  }
}

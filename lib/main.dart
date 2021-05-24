
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenvotive/LoginScreen.dart';
import 'package:tenvotive/firebase_repository/HomeScreen.dart';
import 'package:tenvotive/firebase_repository/repository.dart';
import 'package:tenvotive/mobile_auth/providers/countries.dart';
import 'package:tenvotive/mobile_auth/providers/phone_auth.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneAuthDataProvider(),
        ),
      ],child: MaterialApp(
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
      ));
  }
}

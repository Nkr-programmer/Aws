import 'package:flutter/material.dart';
import 'package:tenvotive/LoginScreen.dart';
import 'package:tenvotive/firebase_repository/methods.dart';

class Normal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final FirebaseMethods authMethods = FirebaseMethods();
    signOut() async {
      final bool isLoggedOut = await FirebaseMethods().signOut();
      if (isLoggedOut) {

        // move the user to login screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (Route<dynamic> route) => false,
        );
      }
    }
    return GestureDetector(onTap: () => signOut(),child:Center(child:Container(
      color:Colors.white,
      child:Text("Sign Out"),
    )));
  }
}
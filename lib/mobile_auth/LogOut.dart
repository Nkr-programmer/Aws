import 'package:flutter/material.dart';
import 'package:tenvotive/LoginScreen.dart';
import 'package:tenvotive/mobile_auth/login_mobile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  String uid = '';
  @override
  void initState() {
  uid ='';
  FirebaseAuth.instance.currentUser().then((val){
    setState(() {
      
      this.uid = val.uid;
    });
  }).catchError((e){
    print(e);
  });
    super.initState();
  }

  Future<void> _logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      Navigator.push(context, 
      MaterialPageRoute(builder: (context)=> HomePage()),);
    } catch(e){
      print(e.toString());
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user"),
        centerTitle: true,

      ),
      body: Center(
        child: Container(color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             Center(child: Text("Welcome",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
	                      ),
              SizedBox(
                height: 10,
                
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.blue,
                  style: BorderStyle.solid,
                  width: 3,

                ),
                child: Text("Log out", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
	                      
                onPressed: (){

                  _logout();
                },
              
                
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
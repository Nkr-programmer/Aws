

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tenvotive/FadeAnimation.dart';
import 'package:tenvotive/firebase_repository/HomeScreen.dart';
import 'package:tenvotive/firebase_repository/repository.dart';
import 'package:tenvotive/mobile_auth/firebase/auth/phone_auth/get_phone.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 FirebaseRepository _repository = FirebaseRepository();
 bool isLoginPressed = false;  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Column(
	          children: <Widget>[
	            Container(
	              height: 400,
	              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/background.png'),
	                  fit: BoxFit.fill
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  Positioned(
	                    left: 30,
	                    width: 80,
	                    height: 200,
	                     child: Container()
	                  ),
	                  Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 150,
	                     child: Container()
	                  ),
	                  Positioned(
	                    right: 40,
	                    top: 40,
	                    width: 80,
	                    height: 150,
	                   child: Container()
	                  ),
	                  Positioned(
	                    child: FadeAnimation(1.6, Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
	                    )),
	                  )
	                ],
	              ),
	            ),
	            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
	                  FadeAnimation(1.8, Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(143, 148, 251, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Column(
	                      children: <Widget>[
	                       
	                       FadeAnimation(2, GestureDetector(
                      onTap: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>  PhoneAuthGetPhone(),),
          (Route<dynamic> route) => false,
        ),
                                          child:Stack(children:[ Container(
	                      height: 50,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(10),
	                        gradient: LinearGradient(
	                          colors: [
	                            Color.fromRGBO(143, 148, 251, 1),
	                            Color.fromRGBO(143, 148, 251, .6),
	                          ]
	                        )
	                      ),
	                      child: Center(
	                        child: Text("Mobile Number", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
	                      ),
	                    ),
                      isLoginPressed?Center(child: CircularProgressIndicator(),):Container()
      ]),
	                  )),
	                      ],
	                    ),
	                  )),
	                  SizedBox(height: 30,),
	                  FadeAnimation(2, GestureDetector(
                      onTap: () => performLogin(),
                                          child:Stack(children:[ Container(
	                      height: 50,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(10),
	                        gradient: LinearGradient(
	                          colors: [
	                            Color.fromRGBO(143, 148, 251, 1),
	                            Color.fromRGBO(143, 148, 251, .6),
	                          ]
	                        )
	                      ),
	                      child: Center(
	                        child: Text("Google Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
	                      ),
	                    ),
                      isLoginPressed?Center(child: CircularProgressIndicator(),):Container()
      ]),
	                  )),
	                  SizedBox(height: 70,),
	                ],
	              ),
	            )
	          ],
	        ),
	      ),
      )
    );
  }
 void    performLogin() {

 print("trying to login");
 setState(() {
   isLoginPressed=true;
 });

   _repository.signIn().then((FirebaseUser user) {
if(user != null){
  authenticateUser(user);
}else{
  print("There was an error");
}
//directly signin
// from clicked email id ans=dd user hve all that details
   });
 }
   void authenticateUser(FirebaseUser user)
{
_repository.authenticateUser(user).then((isNewUser) {
  setState(() {
    isLoginPressed=false;
  });
  if(isNewUser){
    _repository.addDataToDb(user).then((value){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  return Normal();
  },));});
  }
  else{
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  return Normal();
  },));
  }
});
}
}

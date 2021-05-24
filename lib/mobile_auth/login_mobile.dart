import 'package:flutter/material.dart';
import 'package:tenvotive/FadeAnimation.dart';
import 'package:tenvotive/mobile_auth/otp.dart';
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {

//   String phoneNo, smssent, verificationId;

//   get verifiedSuccess => null;

  
  

//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//       	child: Container(
// 	        child: Column(
// 	          children: <Widget>[
// 	            Container(
// 	              height: 400,
// 	              decoration: BoxDecoration(
// 	                image: DecorationImage(
// 	                  image: AssetImage('assets/background.png'),
// 	                  fit: BoxFit.fill
// 	                )
// 	              ),
// 	              child: Stack(
// 	                children: <Widget>[
// 	                  Positioned(
// 	                    left: 30,
// 	                    width: 80,
// 	                    height: 200,
// 	                     child: Container()
// 	                  ),
// 	                  Positioned(
// 	                    left: 140,
// 	                    width: 80,
// 	                    height: 150,
// 	                     child: Container()
// 	                  ),
// 	                  Positioned(
// 	                    right: 40,
// 	                    top: 40,
// 	                    width: 80,
// 	                    height: 150,
// 	                   child: Container()
// 	                  ),
// 	                  Positioned(
// 	                    child: FadeAnimation(1.6, Container(
// 	                      margin: EdgeInsets.only(top: 50),
// 	                      child: Center(
// 	                        child: Text("Mobile Number", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
// 	                      ),
// 	                    )),
// 	                  )
// 	                ],
// 	              ),
// 	            ),
// 	            Padding(
// 	              padding: EdgeInsets.all(30.0),
// 	              child: Column(
// 	                children: <Widget>[
// 	                  FadeAnimation(1.8, Container(
// 	                    padding: EdgeInsets.all(5),
// 	                    decoration: BoxDecoration(
// 	                      color: Colors.white,
// 	                      borderRadius: BorderRadius.circular(10),
// 	                      boxShadow: [
// 	                        BoxShadow(
// 	                          color: Color.fromRGBO(143, 148, 251, .2),
// 	                          blurRadius: 20.0,
// 	                          offset: Offset(0, 10)
// 	                        )
// 	                      ]
// 	                    ),
// 	                    child: Column(
// 	                      children: <Widget>[
	                       
// 	                       FadeAnimation(2,  Container(
// 	                      height: 50,
// 	                    color:Colors.grey,
// 	                      child: Center(
// 	                        child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Enter your phone number",
//               ),
//               onChanged: (value){
//                 this.phoneNo= value;
//               },
//             ),
// 	                      ),
// 	                    ),
            
// 	                  ),
// 	                      ],
// 	                    ),
// 	                  )),
// 	                  SizedBox(height: 30,),
// 	                  FadeAnimation(2, GestureDetector(
//                      onTap: (){ Navigator.push
//             (context, MaterialPageRoute(builder: (context) {
//   return Otp(phoneNo:phoneNo);
//   },));},
//                                           child:Container(
// 	                      height: 50,
// 	                      decoration: BoxDecoration(
// 	                        borderRadius: BorderRadius.circular(10),
// 	                        gradient: LinearGradient(
// 	                          colors: [
// 	                            Color.fromRGBO(143, 148, 251, 1),
// 	                            Color.fromRGBO(143, 148, 251, .6),
// 	                          ]
// 	                        )
// 	                      ),
// 	                      child: Center(
// 	                        child: Text(" Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
// 	                      ),
// 	                    ),
               
// 	                  )),
// 	                  SizedBox(height: 70,),
// 	                ],
// 	              ),
// 	            )
// 	          ],
// 	        ),
// 	      ),
//       )
//     ); 
//   // Scaffold(
//   //     appBar: AppBar(
//   //       title: Center(
//   //         child: Text('PhoneNumber Login'),
//   //       ),
//   //     ),
//   //     body: Column(
//   //       mainAxisAlignment: MainAxisAlignment.center,
//   //       children: <Widget>[
//   //         Padding(
//   //           padding: const EdgeInsets.all(16.0),
//   //           child: TextField(
//   //             decoration: InputDecoration(
//   //               hintText: "Enter your phone number",
//   //             ),
//   //             onChanged: (value){
//   //               this.phoneNo= value;
//   //             },
//   //           ),
//   //         ),
//   //         SizedBox(
//   //           height: 10.0,
//   //         ),
//   //         RaisedButton(
//   //           onPressed: (){ Navigator.push
//   //           (context, MaterialPageRoute(builder: (context) {
//   // return Otp(phoneNo:phoneNo);
//   // },));},
//   //           child: Text("verify",
//   //           style: TextStyle(color: Colors.white),),
//   //           elevation: 7.0,
//   //           color: Colors.blue,
//   //         )
//   //       ],
//   //     ),
      
//   //   );
//   }
// }
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tenvotive/mobile_auth/LogOut.dart';
import 'package:tenvotive/mobile_auth/login_mobile.dart';
import 'package:tenvotive/mobile_auth/numeric_pad.dart';
// class Otp extends StatefulWidget {
// final String phoneNo;
// Otp({this.phoneNo});
//   @override
//   _OtpState createState() => _OtpState();
// }

// class _OtpState extends State<Otp> {
// String smssent, verificationId;

//   get verifiedSuccess => null;

  
//   Future<void> verfiyPhone() async{
//     final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
//       this.verificationId = verId;
//     };
//   final PhoneCodeSent smsCodeSent= (String verId, [int forceCodeResent]) {
//     this.verificationId = verId;
//     smsCodeDialoge(context);
//     print("donr");
//   };
//     final PhoneVerificationCompleted verifiedSuccess= (AuthCredential auth){};
//     final PhoneVerificationFailed verifyFailed= (AuthException e){
//       print('${e.message}');
//     };
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: widget.phoneNo,
//       timeout: const Duration(seconds: 5),
//       verificationCompleted : verifiedSuccess,
//       verificationFailed: verifyFailed,
//       codeSent: smsCodeSent,
//       codeAutoRetrievalTimeout: autoRetrieve,

//     );
  
//   }
//   Widget smsCodeDialoge(BuildContext context){
//     Future.delayed(Duration.zero);
//     return SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[

//             Expanded(
//               child: Container(
//                 color: Colors.white,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[

//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       child: Text(
//                         "Code is sent to " + widget.phoneNo,
//                         style: TextStyle(
//                           fontSize: 22,
//                           color: Color(0xFF818181),
//                         ),
//                       ),
//                     ),

//                     Expanded(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[

//                           buildCodeNumberBox(code.length > 0 ? code.substring(0, 1) : ""),
//                           buildCodeNumberBox(code.length > 1 ? code.substring(1, 2) : ""),
//                           buildCodeNumberBox(code.length > 2 ? code.substring(2, 3) : ""),
//                           buildCodeNumberBox(code.length > 3 ? code.substring(3, 4) : ""),
//                          buildCodeNumberBox(code.length > 4 ? code.substring(4, 5) : ""),
//                           buildCodeNumberBox(code.length > 5 ? code.substring(5, 6) : ""),
//                         ],
//                       ),
//                     ),

//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
                          
//                           Text(
//                             "Didn't recieve code? ",
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Color(0xFF818181),
//                             ),
//                           ),
                          
//                           SizedBox(
//                             width: 8,
//                           ),

//                           GestureDetector(
//                             onTap: () {
                                
//                             },
//                             child: Text(
//                               "Request again",
//                               style: TextStyle(
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
                          
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             Container(
//               height: MediaQuery.of(context).size.height * 0.13,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(25),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Row(
//                   children: <Widget>[

//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//               FirebaseAuth.instance.currentUser().then((user){
//                 if(user != null){
//                   Navigator.of(context).pop();
//                   Navigator.push(
//                     context, 
//                     MaterialPageRoute(
//                       builder: (context)=> LoginPage()),
//                     );
                  
//                 }
//                 else{
//                   Navigator.of(context).pop();
//                   signIn(smssent);
//                 }
//               });
//             },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Color(0xFFFFDC3D),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Verify and Create Account",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                   ],
//                 ),
//               ),
//             ),

//             NumericPad(
//               onNumberSelected: (value) {
//                 print(value);
//                 setState(() {
//                   if(value != -1){
//                     if(code.length < 6){
//                       code = code + value.toString();
//                       this.smssent = code;
//                     }
//                   }
//                   else{
//                     code = code.substring(0, code.length - 1);
//                this.smssent = code;
               
//                   }
//                   print(code);        
//                 });
//               },
//             ),

//           ],
//         )
//       );
//   }
//   Future<void> signIn(String smsCode) async{
//     final AuthCredential credential = PhoneAuthProvider.getCredential(
//       verificationId: verificationId,
//        smsCode: smsCode,);
  
//     await FirebaseAuth.instance.signInWithCredential(
//       credential).then((user) {
//       Navigator.push(context, MaterialPageRoute(
//         builder: (context) => Logout(),),
//       );
//    }).catchError((e){
//      print(e);
//    });
//   }

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     verfiyPhone();
//   }

//   String code = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back,
//             size: 30,
//             color: Colors.black,
//           ),
//         ),
//         title: Text(
//           "Verify phone",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         textTheme: Theme.of(context).textTheme,
//       ),
//       body: Container(child:Text(",gvh"),height:20,width:20,color:Colors.amberAccent),
//     );
//   }

//   Widget buildCodeNumberBox(String codeNumber) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 8),
//       child: SizedBox(
//         width: 40,
//         height: 40,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Color(0xFFF6F5FA),
//             borderRadius: BorderRadius.all(
//               Radius.circular(5),
//             ),
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 25.0,
//                   spreadRadius: 1,
//                   offset: Offset(0.0, 0.75)
//               )
//             ],
//           ),
//           child: Center(
//             child: Text(
//               codeNumber,
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF1F1F1F),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tenvotive/mobile_auth/LogOut.dart';
import 'package:tenvotive/mobile_auth/login_mobile.dart';
class Otp extends StatefulWidget {
final String phoneNo;
Otp({this.phoneNo});
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {

String smssent, verificationId;

  get verifiedSuccess => null;

  
  Future<void> verfiyPhone() async{
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
      this.verificationId = verId;
    };
  final PhoneCodeSent smsCodeSent= (String verId, [int forceCodeResent]) {
    this.verificationId = verId;
    smsCodeDialoge(context).then((value){
     print("Code Sent");
    });
  };
    final PhoneVerificationCompleted verifiedSuccess= (AuthCredential auth){};
    final PhoneVerificationFailed verifyFailed= (AuthException e){
      print('${e.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNo,
      timeout: const Duration(seconds: 5),
      verificationCompleted : verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,

    );
  
  }
  Future<bool> smsCodeDialoge(BuildContext context){
    return showDialog(context: context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return new AlertDialog(
        title: Text('Enter OTP'),
        content: TextField(
          onChanged: (value){
            this.smssent = value;
          },
        ),
        contentPadding: EdgeInsets.all(10.0),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              FirebaseAuth.instance.currentUser().then((user){
                if(user != null){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=> LoginPage()),
                    );
                  
                }
                else{
                  Navigator.of(context).pop();
                  signIn(smssent);
                }
              });
            },
            child: Text('done', 
            style:TextStyle(color: Colors.white) ,),
          ),
        ],

      );
    }
    );
  }
  Future<void> signIn(String smsCode) async{
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
       smsCode: smsCode,);
  
    await FirebaseAuth.instance.signInWithCredential(
      credential).then((user) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => Logout(),),
      );
   }).catchError((e){
     print(e);
   });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    verfiyPhone();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenvotive/database/grepository.dart';
import 'package:tenvotive/database/profile.dart';
import 'package:tenvotive/firebase_repository/HomeScreen.dart';
import 'package:tenvotive/mobile_auth/LogOut.dart';
import 'package:tenvotive/mobile_auth/firebase/auth/phone_auth/select_country.dart';
import 'package:tenvotive/mobile_auth/firebase/auth/phone_auth/verify.dart';
import 'package:tenvotive/mobile_auth/providers/countries.dart';
import 'package:tenvotive/mobile_auth/providers/phone_auth.dart';
import 'package:tenvotive/mobile_auth/utils/constants.dart';

import '../../../utils/widgets.dart';



class PhoneAuthGetPhone extends StatefulWidget {
  final Color cardBackgroundColor = Color(0xFF6874C2);
  final String logo = Assets.firebase;
  final String appName = "Awesome app";

  @override
  _PhoneAuthGetPhoneState createState() => _PhoneAuthGetPhoneState();
}

class _PhoneAuthGetPhoneState extends State<PhoneAuthGetPhone> {
   GFirebaseRepository _repository = GFirebaseRepository();
  double _height, _width, _fixedPadding;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



String smssent, verificationId;

  get verifiedSuccess => null;
 bool isLoginPressed = false;  
  
  Future<void> verfiyPhone(String place) async{
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
      phoneNumber: place+Provider
                  .of<PhoneAuthDataProvider>(context, listen: false)
                  .phoneNumberController.text,
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
        backgroundColor: Colors.white,
        title: Text('ENTER OTP',textAlign: TextAlign.center,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),),
        content: 
      Container(color:Colors.lightBlue,
        child: TextField(
                  onChanged: (value){
                this.smssent = value;
            },
                  autofocus: false,
                  keyboardType: TextInputType.phone,
                  key: Key('EnterPhone-TextFormField'),
                  decoration: InputDecoration(
                  
                     focusedBorder:OutlineInputBorder
                 (borderSide: const BorderSide(color:Colors.black,width:2.0),
                
                  ),
                   errorMaxLines: 1,
                    labelText: "123456",
                    fillColor: Colors.grey,
                  ),
                
              
            ),
      ),
        contentPadding: EdgeInsets.all(10.0),
        actions: <Widget>[

GestureDetector(
                      onTap: (){
              FirebaseAuth.instance.currentUser().then((user){
                if(user != null){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=> PhoneAuthGetPhone()),
                    );
                  
                }
                else{
                  Navigator.of(context).pop();
                  signIn(smssent);
                }
              });
            },
               child:Stack(children:[ Container(
	                      height: 50,width: 100,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(10),
	                        gradient: LinearGradient(
	                          colors: [
	                            Colors.black,
                              Colors.blueGrey,
	                            Colors.grey,
	                          ]
	                        )
	                      ),
	                      child: Center(
	                        child: Text("SUBMIT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
	                      ),
	                    ),
      ]),
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
    authenticateUser();

   }).catchError((e){
     print(e);
   });
  }
  void authenticateUser()
{

FirebaseAuth.instance.currentUser().then((user){
                if(user != null){

_repository.authenticateUser(user).then((isNewUser) {
  if(isNewUser){
   
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  return Profile();
  },));
  }
  else{
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  return HomePage();
  },));
  }
});

}});
}

  final scaffoldKey = GlobalKey<ScaffoldState>(
      debugLabel: "scaffold-get-phone");

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _fixedPadding = _height * 0.025;
    final countriesProvider = Provider.of<CountryProvider>(context);
    final loader = Provider
        .of<PhoneAuthDataProvider>(context)
        .loading;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
                
          Container(  height: 900,   decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/world.jpeg'),
	                  fit: BoxFit.fill
	                )
	              ),),     
            Center(
              child: SingleChildScrollView(
                child: _getBody(countriesProvider),
              ),
            ),
            loader ? CircularProgressIndicator() : SizedBox()
          ],
        ),
      ),
    );
  }
  Widget _getBody(CountryProvider countriesProvider) =>
      Container( 
         decoration: new BoxDecoration(border: Border.all(
                      color: Colors.white24,
                      width: 4.0,
                      style: BorderStyle.solid), //Border.all
  
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
      
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white24,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(1.0, 2.0),
                      blurRadius: 4.5,
                      spreadRadius: 4.5,
                    ), //BoxShadow
                  ],),
          child: countriesProvider.countries.length > 0
              ?  Center(child:_getColumnBody(countriesProvider))
              : Center(child: CircularProgressIndicator()),
        
      );

  Widget _getColumnBody(CountryProvider countriesProvider) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        
 
          Padding(
            padding: EdgeInsets.only(top: _fixedPadding, left: _fixedPadding),
            child: SubTitle(text: 'Select your country',),
          ),
  Padding(
              padding:
              EdgeInsets.only(left: _fixedPadding, right: _fixedPadding),
              child: ShowSelectedCountry(
                country: countriesProvider.selectedCountry,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SelectCountry()),
                  );
                },
              )),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: _fixedPadding),
            child: SubTitle(text: 'Enter your phone'),
          ),
          //  PhoneNumber TextFormFields
          Padding(
            padding: EdgeInsets.only(
                left: _fixedPadding,
                right: _fixedPadding,
                bottom: _fixedPadding),
            child: PhoneNumberField(
              controller:
              Provider
                  .of<PhoneAuthDataProvider>(context, listen: false)
                  .phoneNumberController,
              prefix: countriesProvider.selectedCountry.dialCode ?? "+91",
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(width: _fixedPadding),
              Icon(Icons.info, color: Colors.black, size: 20.0),
              SizedBox(width: 10.0),
              Expanded(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'We will send ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: 'One Time Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: ' to this mobile number',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400)),
                ])),
              ),
              SizedBox(width: _fixedPadding),
            ],
          ),  SizedBox(height: _fixedPadding * 1.5),
           GestureDetector(
                      onTap: () {
                        setState(() {   isLoginPressed=true;
                        verfiyPhone(countriesProvider.selectedCountry.dialCode ?? "+91");
                        });
                        },
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
	                  ), SizedBox(height:20),
        ],
      );

//   _showSnackBar(String text) {
//     final snackBar = SnackBar(
//       content: Text('$text'),
//     );
// //    if (mounted) Scaffold.of(context).showSnackBar(snackBar);
//     scaffoldKey.currentState.showSnackBar(snackBar);
//   }

//   startPhoneAuth() async {
//     final phoneAuthDataProvider =
//     Provider.of<PhoneAuthDataProvider>(context, listen: false);
//     phoneAuthDataProvider.loading = true;
//     var countryProvider = Provider.of<CountryProvider>(context, listen: false);
//     bool validPhone = await phoneAuthDataProvider.instantiate(
//         dialCode: countryProvider.selectedCountry.dialCode,
//         onCodeSent: () {
//           Navigator.of(context).pushReplacement(CupertinoPageRoute(
//               builder: (BuildContext context) => PhoneAuthVerify(phoneNo: Provider
//                   .of<PhoneAuthDataProvider>(context, listen: false)
//                   .phoneNumberController.text)));
//         },
//         onFailed: () {
//           _showSnackBar(phoneAuthDataProvider.message);
//         },
//         onError: () {
//           _showSnackBar(phoneAuthDataProvider.message);
//         });
//     if (!validPhone) {
//       phoneAuthDataProvider.loading = false;
//       _showSnackBar("Oops! Number seems invaild");
//       return;
//     }
//   }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenvotive/LoginScreen.dart';
import 'package:tenvotive/firebase_repository/HomeScreen.dart';
import 'package:tenvotive/mobile_auth/LogOut.dart';
import 'package:tenvotive/mobile_auth/numeric_pad.dart';
import 'package:tenvotive/mobile_auth/providers/phone_auth.dart';
import 'package:tenvotive/mobile_auth/utils/constants.dart';
import 'package:tenvotive/mobile_auth/utils/widgets.dart';

class PhoneAuthVerify extends StatefulWidget {

  final Color cardBackgroundColor = Color(0xFFFCA967);
  final String logo = Assets.firebase;
  final String appName = "Awesome app";
  final String phoneNo;
PhoneAuthVerify({this.phoneNo});

  @override
  _PhoneAuthVerifyState createState() => _PhoneAuthVerifyState();
}

class _PhoneAuthVerifyState extends State<PhoneAuthVerify> {
  double _height, _width, _fixedPadding;

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();
  String code = "";

  @override
  void initState() {
    super.initState();
  }

  final scaffoldKey =
  GlobalKey<ScaffoldState>(debugLabel: "scaffold-verify-phone");

  @override
  Widget build(BuildContext context) {
    //  Fetching height & width parameters from the MediaQuery
    //  _logoPadding will be a constant, scaling it according to device's size
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _fixedPadding = _height * 0.025;

    final phoneAuthDataProvider =
    Provider.of<PhoneAuthDataProvider>(context, listen: false);

    phoneAuthDataProvider.setMethods(
      onStarted: onStarted,
      onError: onError,
      onFailed: onFailed,
      onVerified: onVerified,
      onCodeResent: onCodeResent,
      onCodeSent: onCodeSent,
      onAutoRetrievalTimeout: onAutoRetrievalTimeOut,
    );

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        "Code is sent to " + widget.phoneNo,
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF818181),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          buildCodeNumberBox(code.length > 0 ? code.substring(0, 1) : ""),
                          buildCodeNumberBox(code.length > 1 ? code.substring(1, 2) : ""),
                          buildCodeNumberBox(code.length > 2 ? code.substring(2, 3) : ""),
                          buildCodeNumberBox(code.length > 3 ? code.substring(3, 4) : ""),
                         buildCodeNumberBox(code.length > 4 ? code.substring(4, 5) : ""),
                          buildCodeNumberBox(code.length > 5 ? code.substring(5, 6) : ""),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          
                          Text(
                            "Didn't recieve code? ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF818181),
                            ),
                          ),
                          
                          SizedBox(
                            width: 8,
                          ),

                          GestureDetector(
                            onTap: () {
                                
                            },
                            child: Text(
                              "Request again",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[

                    Expanded(
                      child: GestureDetector(
                                             onTap:signIn(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFDC3D),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Verify and Create Account",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            NumericPad(
              onNumberSelected: (value) {
                print(value);
                setState(() {
                  if(value != -1){
                    if(code.length < 6){
                      code = code + value.toString();
                      this.code = code;
                    }
                  }
                  else{
                    code = code.substring(0, code.length - 1);
               this.code = code;
               
                  }
                  print(code);        
                });
              },
            ),

          ],
        )
      )
    );
  }
  // Widget _getBody() => Card(
  //       color: widget.cardBackgroundColor,
  //       elevation: 2.0,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  //       child: SizedBox(
  //         height: _height * 8 / 10,
  //         width: _width * 8 / 10,
  //         child: _getColumnBody(),
  //       ),
  //     );

  // Widget _getColumnBody() => Column(
  //       children: <Widget>[
  //                 Padding(
  //           padding: EdgeInsets.all(_fixedPadding),
  //           child: PhoneAuthWidgets.getLogo(
  //               logoPath: widget.logo, height: _height * 0.2),
  //         ),
  //           Text(widget.appName,
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 24.0,
  //                 fontWeight: FontWeight.w700)),

  //         SizedBox(height: 20.0),

  //         //  Info text
  //         Row(
  //           children: <Widget>[
  //             SizedBox(width: 16.0),
  //             Expanded(
  //               child: RichText(
  //                 text: TextSpan(
  //                   children: [
  //                     TextSpan(
  //                         text: 'Please enter the ',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.w400)),
  //                     TextSpan(
  //                         text: 'One Time Password',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 16.0,
  //                             fontWeight: FontWeight.w700)),
  //                     TextSpan(
  //                       text: ' sent to your mobile',
  //                       style: TextStyle(
  //                           color: Colors.white, fontWeight: FontWeight.w400),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(width: 16.0),
  //           ],
  //         ),

  //         SizedBox(height: 16.0),

  //         Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             getPinField(key: "1", focusNode: focusNode1),
  //             SizedBox(width: 5.0),
  //             getPinField(key: "2", focusNode: focusNode2),
  //             SizedBox(width: 5.0),
  //             getPinField(key: "3", focusNode: focusNode3),
  //             SizedBox(width: 5.0),
  //             getPinField(key: "4", focusNode: focusNode4),
  //             SizedBox(width: 5.0),
  //             getPinField(key: "5", focusNode: focusNode5),
  //             SizedBox(width: 5.0),
  //             getPinField(key: "6", focusNode: focusNode6),
  //             SizedBox(width: 5.0),
  //           ],
  //         ),

  //         SizedBox(height: 32.0),

  //         RaisedButton(
  //           elevation: 16.0,
  //           onPressed: signIn,
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text(
  //               'VERIFY',
  //               style: TextStyle(
  //                   color: widget.cardBackgroundColor, fontSize: 18.0),
  //             ),
  //           ),
  //           color: Colors.white,
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(30.0)),
  //         )
  //       ],
  //     );
  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75)
              )
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
  _showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text('$text'),
      duration: Duration(seconds: 2),
    );
//    if (mounted) Scaffold.of(context).showSnackBar(snackBar);
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  signIn() {
    if (code.length != 6) {
      _showSnackBar("Invalid OTP");
    }
    Provider.of<PhoneAuthDataProvider>(context, listen: false)
        .verifyOTPAndLogin(smsCode: code);
  }

  // This will return pin field - it accepts only single char
  Widget getPinField({String key, FocusNode focusNode}) => SizedBox(
        height: 40.0,
        width: 35.0,
        child: TextField(
          key: Key(key),
          expands: false,
//          autofocus: key.contains("1") ? true : false,
          autofocus: false,
          focusNode: focusNode,
          onChanged: (String value) {
            if (value.length == 1) {
              code += value;
              switch (code.length) {
                case 1:
                  FocusScope.of(context).requestFocus(focusNode2);
                  break;
                case 2:
                  FocusScope.of(context).requestFocus(focusNode3);
                  break;
                case 3:
                  FocusScope.of(context).requestFocus(focusNode4);
                  break;
                case 4:
                  FocusScope.of(context).requestFocus(focusNode5);
                  break;
                case 5:
                  FocusScope.of(context).requestFocus(focusNode6);
                  break;
                default:
                  FocusScope.of(context).requestFocus(FocusNode());
                  break;
              }
            }
          },
          maxLengthEnforced: false,
          textAlign: TextAlign.center,
          cursorColor: Colors.white,
          keyboardType: TextInputType.number,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      );

  onStarted() {
    _showSnackBar("PhoneAuth started");
//    _showSnackBar(phoneAuthDataProvider.message);
  }

  onCodeSent() {
    _showSnackBar("OPT sent");
//    _showSnackBar(phoneAuthDataProvider.message);
  }

  onCodeResent() {
    _showSnackBar("OPT resent");
//    _showSnackBar(phoneAuthDataProvider.message);
  }

  onVerified() async {
    _showSnackBar(
        "${Provider
            .of<PhoneAuthDataProvider>(context, listen: false)
            .message}");
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Normal()));
  }

  onFailed() {
//    _showSnackBar(phoneAuthDataProvider.message);
    _showSnackBar("PhoneAuth failed");
  }

  onError() {
//    _showSnackBar(phoneAuthDataProvider.message);
    _showSnackBar(
        "PhoneAuth error ${Provider
            .of<PhoneAuthDataProvider>(context, listen: false)
            .message}");
  }

  onAutoRetrievalTimeOut() {
    _showSnackBar("PhoneAuth autoretrieval timeout");
//    _showSnackBar(phoneAuthDataProvider.message);
  }
}

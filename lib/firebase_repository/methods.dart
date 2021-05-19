import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tenvotive/user.dart';

class FirebaseMethods
{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  GoogleSignIn _googleSignIn=GoogleSignIn();
  static final Firestore firestore = Firestore.instance;
  //1
Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    
    //it just gives us the idea some one is logedin(if yes who) or not
    return currentUser;
  }

  //2
 Future<FirebaseUser> signIn() async{
GoogleSignInAccount _signinAccount =await _googleSignIn.signIn();
GoogleSignInAuthentication _signinAuthentication 
=await _signinAccount.authentication;

final AuthCredential credential 
=GoogleAuthProvider.getCredential(accessToken: 
_signinAuthentication.accessToken, idToken:_signinAuthentication.idToken );

AuthResult result = await _auth.signInWithCredential(credential);
FirebaseUser user =result.user;
return user;
//FIRST _SIGNINACCOUNT TAKE THE DETAILS WHEN WE CLICK ON EMAILID
//THEN _SIGNINAUTHENTICATION TAKE THE AUTHENTICATION
//AND THEN CREDENDIAL 
//**  SIGNINWITHCREDENDIAL DIRECTLY SIGNIN WITH EMAIL ID
}


//3
  Future<bool> authenticateUser(FirebaseUser user) async {
    QuerySnapshot result = await firestore
        .collection("users")
        .where("email", isEqualTo: user.email)
        .getDocuments();
//** query from authentication which take is it already registered or not
// because if there is registered then dont need to pass the data again 
//else upload the data in database  AUTHENTICATION AND DATABASE 
//ARE DIFFERENT IN THIS AUTHENTICATION IS USED
    final List<DocumentSnapshot> docs = result.documents;

    //if user is registered then length of list > 0 or else less than 0
    return docs.length == 0 ? true : false;
  }

//4
  Future<void> addDataToDb(FirebaseUser currentUser) async {
    User user = User(
        uid: currentUser.uid,
        email: currentUser.email,
        name: currentUser.displayName,
        profilePhoto: currentUser.photoUrl,
        username: currentUser.email);
//this is to store currently loggedin user details to class user
    firestore
        .collection("users")
        .document(currentUser.uid)
        .setData(user.toMap(user));
//to send the all the login releated data to data base 

  }
   Future<bool> signOut() async {
  try{
      await _googleSignIn.signOut();
   await _auth.signOut();
    return true;
  }
  catch(e){
    return false;
  }
  }
//FROM 1 TO 4 GOOGLE SIGNIN
//signout is at end
//Now crud operations is started 
 

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tenvotive/database/guser.dart';

class GFirebaseMethods
{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  static final Firestore firestore = Firestore.instance;
FirebaseUser currentUser,users;
  Future<FirebaseUser> getCurrentUser() async {
    
    currentUser = await _auth.currentUser();
    
    //it just gives us the idea some one is logedin(if yes who) or not
    return currentUser;
  }




 Future<bool> authenticateUser(FirebaseUser user) async {
    QuerySnapshot result = await firestore
        .collection("profile")
        .where("uid", isEqualTo: user.uid)
        .getDocuments();
    final List<DocumentSnapshot> docs = result.documents;
    return docs.length == 0 ? true : false;
  }
Future<List<GUser>> fetch() async {
   users=await _auth.currentUser();
   List<GUser> userList = List<GUser>();
  QuerySnapshot result=await firestore
        .collection("profile")
        .where("uid", isEqualTo: users.uid)
        .getDocuments();
    for (var i = 0; i < result.documents.length; i++) { 
     userList.add(GUser.fromMap( result.documents[i].data));
    }
return userList;
}





 Future<void> addDataToDb(GUser currentUser) async {
   users=await _auth.currentUser();
    GUser user = GUser(
        uid: users.uid,
         name: currentUser.name,
        age: currentUser.age,
        address: currentUser.address,
         covid:currentUser.covid,
        recovered:currentUser.recovered,
        blood:currentUser.blood,
        gender:currentUser.gender,
        email:currentUser.email,
        );
//this is to store currently loggedin user details to class user
    firestore
        .collection("profile")
        .document(users.uid)
        .setData(user.toMap(user));
//to send the all the login releated data to data base 

  }
}
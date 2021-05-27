

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tenvotive/database/gmethods.dart';
import 'package:tenvotive/database/guser.dart';

class GFirebaseRepository{
  GFirebaseMethods _firebaseMethods=GFirebaseMethods();
  Future<bool> authenticateUser(FirebaseUser user)=> _firebaseMethods.authenticateUser(user);
Future<void> addDataToDb(GUser user)=> _firebaseMethods.addDataToDb(user);
Future<List<GUser>> fetch()=>_firebaseMethods.fetch();
}
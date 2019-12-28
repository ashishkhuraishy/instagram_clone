import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/Models/User.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _dataBase = Firestore.instance;

  User _getUserFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_getUserFromFireBaseUser);
  }

  Future signUpUser(
      {BuildContext context,
      String userName,
      String email,
      String password,
      String profieImage}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      if (user != null) {
        _dataBase.collection("Users").document(user.uid).setData(
            {"userName": userName, "email": email, "profileImage": ""});

        return _getUserFromFireBaseUser(user);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logInUser({String email, String password}) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _getUserFromFireBaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOutUser() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}

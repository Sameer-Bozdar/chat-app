import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
//  Firebase Auth Instance

  FirebaseAuth _auth = FirebaseAuth.instance;

// register user

  Future<UserCredential?> registerUser(String email, dynamic password) {
    try {
      return _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign in

  Future<UserCredential?> signIn(String email, dynamic password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //  sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }
  // delete user

  //  handling errors
}

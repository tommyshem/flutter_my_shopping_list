import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/material.dart';

// firebase real database functions
class Anonymously {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // sign in anonymously
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // register with name and password

  // sign out
}

// check state of user - ie signed in or not
Future checkIfSignedIn() async {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      debugPrint('User is currently signed out!');
    } else {
      debugPrint('User is signed in!');
    }
  });
}

// create a new user on the firebase database
Future<UserCredential?> createUser(emailAddress, password) async {
  UserCredential? credential;
  try {
    credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return credential;
}

// sign in with email and password to the firebase database
Future<bool?> signInUser(String? emailAddress, String? password) async {
  try {
    //  emailAddress != null ? "" : "";
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress as String,
      password: password as String,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      debugPrint('No user found for that email.');
      return false;
    } else if (e.code == 'wrong-password') {
      debugPrint('Wrong password provided for that user.');
      return false;
    } else {
      debugPrint(e.code.toString());
      return false;
    }
  }
  return true;
}

// sign out of the firebase database
Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

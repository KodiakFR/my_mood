import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_mood/models/user_entity.dart';

class UserServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
/**
 * Connexion d'un user avec un mail et mot de passe
 */
  Future<dynamic> auth(UserEntity user) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);
      return userCredential;
    } catch (e) {
      return null;
    }
  }

/**
 * Connexion d'un user avec un compte gmail
 */
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future createUser(UserEntity user) async {
    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        String msgError = "The password provided is too weak.";
        return msgError;
      } else if (e.code == 'email-already-in-use') {
        String msgError = 'The account already exists for that email.';
        return msgError;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

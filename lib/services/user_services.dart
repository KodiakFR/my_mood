import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_mood/models/user_entity.dart';

class UserServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Stream pour garder la connection
  Stream<UserEntity> get userConnected {
    return _auth
        .authStateChanges()
        .asyncMap((user) => UserEntity(email: user!.email));
  }

  ///Connexion d'un user avec un mail et mot de passe
  Future<dynamic> auth(UserEntity user) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);
      return userCredential;
    } catch (e) {
      return null;
    }
  }

  ///Connexion d'un user avec un compte gmail
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

  Future createUser(UserEntity userEntity) async {
    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: userEntity.email!,
        password: userEntity.password!,
      );
      User? user = credential.user;
      user?.updateDisplayName(userEntity.name);
      user?.updatePhotoURL(
          'https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small/profile-icon-design-free-vector.jpg');
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
      return null;
    }
  }

  ///Déconnection
  Future disconnect() async {
    await _auth.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_mood/models/user_entity.dart';
import 'package:my_mood/services/user_services.dart';

class ConnectionVM {
  final UserServices _userServices = UserServices();

  //connection à l'application avec email et mot de passe
  Future auth(UserEntity user) async {
      dynamic result = await _userServices.auth(user);
      return result;

  }

  Future<UserCredential> authWithGmail() async {
    UserCredential userCredential = await _userServices.signInWithGoogle();

    return userCredential;
  }
}

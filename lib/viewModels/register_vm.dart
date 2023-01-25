import 'package:my_mood/models/user_entity.dart';

import '../services/user_services.dart';

class RegisterVM {
  final UserServices _userServices = UserServices();

  Future createUser(UserEntity user) async {
    dynamic result = await _userServices.createUser(user);
    return result;
  }
}

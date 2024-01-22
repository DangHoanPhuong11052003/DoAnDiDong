import 'package:app_adidark_store/views/SignUp_In/respository/Authentication_Repository.dart';
import 'package:app_adidark_store/views/SignUp_In/respository/User_Respository.dart';
import 'package:get/get.dart';

import '../../../models/ClassUser.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(Auth_Resposity());
  final _userRepo = Get.put(UserResposity());

  Future<Users> getUserData() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return await _userRepo.getUserDetails(email);
    } else {
      throw Exception('User email is null');
    }
  }
}

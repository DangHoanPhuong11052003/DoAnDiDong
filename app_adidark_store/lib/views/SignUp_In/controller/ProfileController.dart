import 'package:app_adidark_store/views/SignUp_In/respository/Authentication_Repository.dart';
import 'package:app_adidark_store/views/SignUp_In/respository/User_Respository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(Auth_Resposity());
  final _userRepo = Get.put(UserResposity());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }
}

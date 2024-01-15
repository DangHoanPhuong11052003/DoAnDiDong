import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:app_adidark_store/models/ClassUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'Authentication_Repository.dart';
import 'User_Respository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  // final comfirm_password = TextEditingController();

  final authRepo = Get.put(Auth_Resposity());
  final userRepo = Get.put(UserResposity());

  // void registerUser(String email, String password) {
  //   Auth_Resposity.instance.createAccount(email, password);
  // }
   Future<void> getUser() async {
    await userRepo.getUser();
  }

  Future<bool> checkUserData() async {
    try {
      final hasUserData = await userRepo.checkUserData();
      print('Has user data: $hasUserData');
    } catch (error) {
      // Xử lý lỗi nếu cần thiết
      print('Error occurred: $error');
    }
    throw Exception('Unexpected error occurred while checking user data');
  }

   Future<void> loginAccount(String emai, String password) async {
  await authRepo.loginAccount(emai, password);
}
 
}

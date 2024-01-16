import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import '../../../models/ClassUser.dart';
import '../respository/Authentication_Repository.dart';
import '../respository/User_Respository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // final fullname = TextEditingController();
  // final email = TextEditingController();
  // final password = TextEditingController();
  // final comfirm_password = TextEditingController();

  final authRepo = Get.put(Auth_Resposity());

  //
  Future<void> loginAccount(Users user) async {
    await authRepo.loginAccount(user);
  }

  //
  Future<void> route(BuildContext context, Widget destination) async {
    authRepo.route(context, destination);
  }
}

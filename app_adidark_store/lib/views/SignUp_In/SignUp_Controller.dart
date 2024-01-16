import 'package:app_adidark_store/models/ClassUser.dart';
import 'package:app_adidark_store/views/SignUp_In/Authentication_Repository.dart';
import 'package:app_adidark_store/views/SignUp_In/User_Respository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  // final comfirm_password = TextEditingController();

  final userRepo = Get.put(UserResposity());
  final authRepo = Get.put(Auth_Resposity());

  // void registerUser(String email, String password) {
  //   Auth_Resposity.instance.createAccount(email, password);
  // }

  Future<void> createUser(UserDetailInfo user) async {
    await userRepo.createUser(user);
  }

  Future<void> createAccount(String emai, String password) async {
    await authRepo.createAccount(emai, password);
  }
}

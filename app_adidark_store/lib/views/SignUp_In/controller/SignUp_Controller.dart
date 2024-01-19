import 'package:app_adidark_store/models/ClassUser.dart';
import 'package:app_adidark_store/views/SignUp_In/respository/User_Respository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../respository/Authentication_Repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepo = Get.put(UserResposity());

  Future<void> createUser(Users user) async {
    await userRepo.createUser(user);
  }

  // var userName = ''.obs;

  // Future<void> getUserNameFromFirestore(Users user) async {
  //   userName.value = await userRepo.getUserNameFromFirestore(user);
  //   userRepo.update();
  // }
}

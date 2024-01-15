import 'package:app_adidark_store/items/BottomMenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:get/get.dart';
import '../../models/ClassUser.dart';

class UserResposity extends GetxController {
  static UserResposity get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(User user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
              "Success",
              "Your account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green,
            ))
        .catchError((error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
    });
  }

  getUser() async {
    FirebaseAuth.User? currentUser =
        FirebaseAuth.FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser.uid)
          .get();
    }
  }

 Future<bool> checkUserData() async {
  try {
    // Gọi hàm getUser() để lấy dữ liệu người dùng
    final documentSnapshot = await getUser();

    // Kiểm tra dữ liệu
    if (documentSnapshot.exists) {
      return true; // Có dữ liệu người dùng
    } else {
      return false; // Không có dữ liệu người dùng
    }
  } catch (error) {
    // Xử lý lỗi nếu cần thiết
    print('Error occurred: $error');
    throw Exception('Error occurred while checking user data');
  }

  // Thêm câu lệnh return hoặc throw ở cuối hàm
  throw Exception('Unexpected error occurred while checking user data');
}

}

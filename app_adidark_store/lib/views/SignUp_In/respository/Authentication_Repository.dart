import 'package:app_adidark_store/items/BottomMenu.dart';
import 'package:app_adidark_store/views/SignUp_In/SignInScreen.dart';
import 'package:app_adidark_store/views/SignUp_In/controller/SignUp_Failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/ClassUser.dart';
import '../../TrangChu/HomePage.dart';

class Auth_Resposity extends GetxController {
  static Auth_Resposity get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  late Rx<User?> firebaseUser = Rx<User?>(null);
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const BottomMenu())
        : Get.offAll(() => const BottomMenu());
  }

  loginAccount(Users user) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password.toString(),
      );
    } on FirebaseAuthException catch (e) {
      final ex = SignUp_AccountFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw SignUp_AccountFailure(ex.message);
    } catch (_) {}
  }
}

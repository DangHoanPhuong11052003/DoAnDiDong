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
  final deviceStorage = GetStorage();

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
        ? Get.offAll(() => const Login_Screen())
        : Get.offAll(() => const BottomMenu());
  }

  loginAccount(Users user) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password.toString(),
      );
    } on FirebaseAuthException catch (e) {
      final ex = SignUp_AccountFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw SignUp_AccountFailure(ex.message);
    } catch (_) {}
  }

  void route(BuildContext context, Widget destination) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Future<void> logoutAccount() async => await _auth.signOut();
}

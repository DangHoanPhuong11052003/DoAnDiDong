import 'package:app_adidark_store/views/SignUp_In/controller/SignUp_Failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/ClassUser.dart';


class Auth_Resposity extends GetxController {
  static Auth_Resposity get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  
  // final deviceStorage = GetStorage();
  // late final Rx<User?> firebaseUser;

  // @override
  // void onReady() {
  //   FlutterNativeSplash.remove();
  //   firebaseUser = Rx<User?>(_auth.currentUser);
  //   firebaseUser.bindStream(_auth.userChanges());

  //   ever(firebaseUser, _setInitialScreen);
  // }

 

  // _setInitialScreen(User? user) {
  //   user == null
  //       ? Get.offAll(() => const Login_Screen())
  //       : Get.offAll(() => const HomePageFix());
  // }

  loginAccount(Users user) async {
  try {
    final credential = await _auth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
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

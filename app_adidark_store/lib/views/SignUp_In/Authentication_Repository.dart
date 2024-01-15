import 'package:app_adidark_store/items/BottomMenu.dart';
import 'package:app_adidark_store/views/SignUp_In/SignInScreen.dart';
import 'package:app_adidark_store/views/SignUp_In/SignUp_Failure.dart';
import 'package:app_adidark_store/views/TrangChu/HomePage.dart';
import 'package:app_adidark_store/views/TrangChu/HomePageFix.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Auth_Resposity extends GetxController {
  static Auth_Resposity get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

 

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const Login_Screen())
        : Get.offAll(() => const HomePageFix());
  }

  Future<void> createAccount(String email, String password) async {
  try {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    _setInitialScreen(_auth.currentUser);
  } on FirebaseAuthException catch (e) {
    final ex = SignUp_AccountFailure.code(e.code);
    print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    throw ex;
  } catch (_) {}
}

  Future<void> loginAccount(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      const ex = SignUp_AccountFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {}
  }

  Future<void> logoutAccount() async => await _auth.signOut();
}

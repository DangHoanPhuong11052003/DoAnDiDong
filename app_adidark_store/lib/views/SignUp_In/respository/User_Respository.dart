import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../models/ClassUser.dart';
import '../controller/SignUp_Failure.dart';

class UserResposity extends GetxController {
  static UserResposity get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  // Tạo user
  createUser(Users user) async {
    try{
         await _auth
          .createUserWithEmailAndPassword(email: user.email, password: user.password)
          .then((value) => postDetailsToFirestore(user));
    }on FirebaseAuthException catch (e) {
    final ex = SignUp_AccountFailure.code(e.code);
    print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    throw ex;
  } catch (_) {}
  }

  // Lưu trữ vào firestore
  postDetailsToFirestore(
    Users user
  ) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var _user = _auth.currentUser;
    CollectionReference ref = firebaseFirestore.collection('Users');

    Users newUser = Users(
      fullName: user.fullName,
      address: user.address,
      email: user.email,
      password: user.password,
    );
    ref.doc(_user!.uid).set(newUser.toJson());
}

}

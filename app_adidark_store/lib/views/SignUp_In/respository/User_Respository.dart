import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../models/ClassUser.dart';
import '../controller/SignUp_Failure.dart';

class UserResposity extends GetxController {
  static UserResposity get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  // Tạo user
  createUser(Users user) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password.toString())
          .then((value) => postDetailsToFirestore(user));
    } on FirebaseAuthException catch (e) {
      final ex = SignUp_AccountFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {}
  }

  // Lưu trữ vào firestore
  postDetailsToFirestore(Users user) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var _user = _auth.currentUser;
    CollectionReference ref = firebaseFirestore.collection('Users');

    Users newUser = Users(
        fullName: user.fullName,
        address: user.address,
        email: user.email,
        // password: user.password,
        agree: user.agree);
    ref.doc(_user!.uid).set(newUser.toJson());
  }

  Future<Users> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('Users').where('Email', isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => Users.fromSnapshot(e)).single;
    return userData;
  }

  Future<Users> allUser() async {
    final snapshot =
        await _db.collection('Users').get();
    final userData = snapshot.docs.map((e) => Users.fromSnapshot(e)).single;
    return userData;
  }

//  Future<String> getUserNameFromFirestore(Users user) async {
//   User? currentUser = FirebaseAuth.instance.currentUser;

//   DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//       .collection('Users')
//       .doc(currentUser!.uid)
//       .get();

//   if (documentSnapshot.exists) {
//     Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
//     String userName = data['FullName'] as String;
//     return userName;
//   } else {
//     print('Document does not exist in the database');
//     return '';
//   }
// }
}

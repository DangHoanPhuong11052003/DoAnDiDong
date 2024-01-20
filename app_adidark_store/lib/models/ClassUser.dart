import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String? id;
  String? fullName;
  Map<String, dynamic>? address;
  String email;
  String? password;
  bool? agree;

  Users({
    this.id,
    this.fullName,
    this.address,
    required this.email,
    this.password,
    this.agree,
  });

  toJson() {
    return {
      "FullName": fullName,
      'Address': address,
      "Email": email,
      "Password": password,
      'Agree': agree,
    };
  }

  // lấy dữ liệu
  factory Users.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Users(
      id: document.id,
      fullName: data['FullName'],
      address: data['Address'],
      email: data['Email'],
      password: data['Password'],
    );
  }
}

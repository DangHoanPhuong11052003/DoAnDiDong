import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String? id;
  String? fullName;
  Map<dynamic, dynamic>? address;
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

  factory Users.fromSnapshot(DocumentSnapshot<Map<dynamic, dynamic>?> document) {
  final data = document.data()!;
  // final addressJson = data['Address'];
  // Map<dynamic, dynamic>? address;

  // if (addressJson is Map<dynamic, dynamic>) {
  //   // Dữ liệu trong trường Address là một đối tượng kiểu Map<dynamic,dynamic>
  //   address = addressJson;
  // } else if (addressJson is String) {
  //   // Dữ liệu trong trường Address là một chuỗi JSON
  //   try {
  //     address = jsonDecode(addressJson);
  //   } catch (e) {
  //     print('Lỗi phân tích JSON: $e');
  //     print('Chuỗi JSON không hợp lệ: $addressJson');
  //   }
  // }

  return Users(
    id: document.id,
    fullName: data['FullName'],
    // address: address,
    email: data['Email'],
    password: data['Password'],
  );
}
}

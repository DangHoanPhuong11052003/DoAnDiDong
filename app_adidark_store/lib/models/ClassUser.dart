import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String? id;
  final String? fullName;
  final String? address;
  final String email;
  final String? password;
  final bool? agree;

  const Users(
      {this.id,
      this.fullName,
      this.address,
      required this.email,
      this.password,
      this.agree});

  toJson() {
    return {
      "FullName": fullName,
      'Address': address,
      "Email": email,
      "Password": password,
      'Agree': agree
    };
  }

  factory Users.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Users (
      id: document.id,
      fullName: data['FullName'],
      address:data['Address'],
      email: data['Email'],
      password: data['Password'],
    );
  }
}

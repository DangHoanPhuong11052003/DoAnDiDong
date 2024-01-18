class Users {
  String? id;
  String? fullName;
  String? address;
  String email;
  String? password;
  bool? agree;

  Users(
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
      'Agree': agree
    };
  }
}

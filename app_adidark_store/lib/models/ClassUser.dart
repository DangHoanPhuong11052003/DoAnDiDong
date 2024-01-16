class UserDetailInfo {
  String fullName;
  String email;
  String password;
  String address;

  UserDetailInfo({
    required this.fullName,
    required this.email,
    required this.password,
    required this.address,
  });

  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "password": password,
      "address": address,
    };
  }
}

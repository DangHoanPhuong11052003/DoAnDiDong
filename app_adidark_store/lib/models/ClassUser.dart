class UserDetailInfo {
  final int id;
  final String fullName;
  final String email;
  final String password;
  final String address;

  UserDetailInfo({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.address,
  });

  toJson() {
    return {
      "Id": id,
      "FullName": fullName,
      "Email": email,
      "Password": password,
      "Address": address,
    };
  }
}

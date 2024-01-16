class Users{
  final String? id;
  final String? fullName;
  final String? address;
  final String email;
  final String password;

  const Users(
      {this.id,
       this.fullName,
      this.address,
      required this.email,
      required this.password});

  toJson() {
    return {"FullName": fullName, 'Address': address, "Email": email, "Password": password};
  }
}

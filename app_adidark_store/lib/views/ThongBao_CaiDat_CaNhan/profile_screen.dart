import 'package:app_adidark_store/items/profile_item.dart';
import 'package:app_adidark_store/models/ClassUser.dart';
import 'package:app_adidark_store/views/HoaDon/HoaDon_Screen.dart';
import 'package:app_adidark_store/views/SignUp_In/SignInScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late String email;
  late String fullName;
  late String password;
  late String address;

  Users user =  Users(
    fullName: "",
    email: "",
    password: "",
    address: {
      "Home": null,
      "Company": null,
      "Etc": null,
    },
  );

  final _user = FirebaseAuth.instance.currentUser;

  Future<void> getUserDetailInfo() async {
    final SharedPreferences prefs = await _prefs;
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection("Users").doc(_user?.uid);

    try {
      // Lấy dữ liệu từ Firestore
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await documentReference.get();

      // Đảm bảo rằng tài liệu tồn tại và có dữ liệu
      if (documentSnapshot.exists) {
        // Lấy tất cả các trường (fields) từ tài liệu
        Map<String, dynamic> documentData = documentSnapshot.data()!;

        documentData.forEach((key, value) async {
          await prefs.setString(key, value);
        });
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error getting document fields: $e');
    }

    email = prefs.getString("Email") ?? "";
    fullName = prefs.getString("FullName") ?? "";
    password = prefs.getString("Password") ?? "";
    address = prefs.getString("Address") ?? "";

    user = Users(
      fullName: fullName,
      email: email,
      password: password,
      address: {
        "home": null,
        "company": null,
        "etc": null,
      },
    );
  }

  Future<void> logout(BuildContext context) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove("FullName");
    await prefs.remove("Email");
    await prefs.remove("Password");
    await prefs.remove("Address");
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login_Screen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Thông tin cá nhân",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: FutureBuilder(
            future: getUserDetailInfo(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Icon(
                                        Icons.account_circle,
                                        size:
                                            MediaQuery.of(context).size.width /
                                                4,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          user.fullName ?? "",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          user.email.replaceRange(
                                              1,
                                              user.email.lastIndexOf("@"),
                                              "*****"),
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ProfileItem(
                                    icon: Icons.account_circle,
                                    title: "Tài khoản",
                                    sub: "Tài khoản & Bảo mật",
                                    onTap: () {
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const AccountSetting()))
                                          .then((value) => setState(() => {}));
                                    },
                                  ),
                                  ProfileItem(
                                    icon: Icons.access_time,
                                    title: "Lịch sử giao dịch",
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HoaDon_Screen()));
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    child: Center(
                                        child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      elevation: 5.0,
                                      height: 45,
                                      minWidth: double.infinity,
                                      onPressed: () {
                                        logout(context);
                                      },
                                      child: Text(
                                        "Đăng xuất",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      color: Color(0xFFADDDFF),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              }
            }),
      ),
    );
  }
}

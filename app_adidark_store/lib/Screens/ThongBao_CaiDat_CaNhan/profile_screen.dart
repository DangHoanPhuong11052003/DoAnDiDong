import 'package:app_adidark_store/Screens/HoaDon/HoaDon_Screen.dart';
import 'package:app_adidark_store/Screens/SignUp_In/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Items/profile_item.dart';
import '../../Provider/google_sign_in.dart';
import 'setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        child: Padding(
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
                            size: MediaQuery.of(context).size.width / 4,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "DeLe",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "d*******@gmail.com",
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
                                      const AccountSetting()));
                        },
                      ),
                      ProfileItem(
                        icon: Icons.access_time,
                        title: "Lịch sử giao dịch",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HoaDon_Screen()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 7),
                        child: GestureDetector(
                          onTap: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.Logout();
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            child: Center(
                              child: InkWell(
                                onTap: null,
                                borderRadius: BorderRadius.circular(50),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFADDDFF),
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Đăng xuất',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

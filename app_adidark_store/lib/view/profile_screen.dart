import 'package:app_adidark_store/item/profile_item.dart';
import 'package:app_adidark_store/view/notification_screen.dart';
import 'package:app_adidark_store/view/setting_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.img,
  });

  final String img;
  String name, email;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.email.length > 27) {
      widget.email = "${widget.email.substring(0, 27)}...";
    }

    if (widget.name.length > 20) {
      widget.name = "${widget.name.substring(0, 20)}...";
    }

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
                          child: Image.network(
                            widget.img,
                            width: MediaQuery.of(context).size.width / 4,
                            fit: BoxFit.fill,
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
                              widget.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.email,
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
                        onTap: () {},
                      ),
                      ProfileItem(
                        icon: Icons.language,
                        title: "Ngôn ngữ / Language",
                        sub: "Tiếng Việt",
                        onTap: () {},
                      ),
                      ProfileItem(
                        icon: Icons.notifications_none,
                        title: "Thông báo",
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationScreen()));
                        },
                      ),
                      ProfileItem(
                        icon: Icons.access_time,
                        title: "Lịch sử giao dịch",
                        onTap: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 7),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(203, 233, 255, 0.7),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.logout_rounded,
                                    size: MediaQuery.of(context).size.width / 9,
                                  ),
                                  Text(
                                    "Đăng xuất",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
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

import 'package:app_adidark_store/item/profile_item.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(203, 233, 255, 0.4),
        title: Text(
          "Cài đặt",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(203, 233, 255, 0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

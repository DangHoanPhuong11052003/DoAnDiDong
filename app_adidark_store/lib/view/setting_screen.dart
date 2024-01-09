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
          "Setting",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
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
                  icon: Icons.vpn_key,
                  title: "Account",
                  sub: "Privacy, Securiry",
                  onTap: () {},
                ),
                ProfileItem(
                  icon: Icons.language,
                  title: "App Language",
                  sub: "English",
                  onTap: () {},
                ),
                ProfileItem(
                  icon: Icons.notifications_none,
                  title: "Notifications",
                  sub: "Messages",
                  onTap: () {},
                ),
                ProfileItem(
                  icon: Icons.phone_outlined,
                  title: "Help",
                  sub: "Contact us, Privacy Policy",
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

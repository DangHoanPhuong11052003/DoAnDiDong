import 'package:flutter/material.dart';
import '../../Items/profile_item.dart';
import 'notification_screen.dart';
import 'setting_screen.dart';

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
        backgroundColor: Color.fromRGBO(203, 233, 255, 0.4),
        title: const Center(
          child: Text(
            "My Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(203, 233, 255, 0.4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Container(
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
                        width: MediaQuery.of(context).size.width / 1.5,
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileItem(
                          icon: Icons.settings,
                          title: "Setting",
                          onTap: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SettingScreen()));
                          },
                        ),
                        ProfileItem(
                          icon: Icons.notifications_none,
                          title: "Notifications",
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
                          title: "Order History",
                          onTap: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 7),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.logout_rounded,
                                      size:
                                          MediaQuery.of(context).size.width / 9,
                                    ),
                                    Text(
                                      "Logout",
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
      ),
    );
  }
}

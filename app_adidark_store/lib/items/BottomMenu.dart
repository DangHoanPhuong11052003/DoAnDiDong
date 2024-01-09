import 'package:app_adidark_store/view/notification_screen.dart';
import 'package:app_adidark_store/view/setting_screen.dart';
import 'package:flutter/material.dart';

import '../Screens/Gio_Hang/CartScreen.dart';
import '../Screens/SignUp_In/HomePage.dart';

class BottomMenu extends StatefulWidget {
  BottomMenu({
    Key? key,
  });

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int current_index = 0;

  final pages = [
    const HomePage(),
    const CartScreen(),
    const NotificationScreen(),
    const SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF0597F2),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            tooltip: "Trang chủ",
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify),
            tooltip: "Tất cả thiết bị",
            label: "Tất cả thiết bị",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            tooltip: "Trang cá nhân",
            label: "Trang cá nhân",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            tooltip: "Trang cá nhân",
            label: "Trang cá nhân",
          ),
        ],
        currentIndex: current_index,
        onTap: (index) {
          setState(() {
            current_index = index;
          });
        },
      ),
    );
  }
}

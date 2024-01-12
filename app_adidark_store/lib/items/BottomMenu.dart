import 'package:flutter/material.dart';
import '../Screens/Gio_Hang/CartScreen.dart';
import '../Screens/ThongBao_CaiDat_CaNhan/notification_screen.dart';
import '../Screens/ThongBao_CaiDat_CaNhan/profile_screen.dart';
import '../Screens/TrangChu/HomePage.dart';
import '../Screens/TrangChu/HomePageFix.dart';
import '../Screens/HoaDon/HoaDon_Screen.dart';


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
    const HomePageFix(),
    const CartScreen(),
    const NotificationScreen(),
    const ProfileScreen()
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
            tooltip: "Giỏ hàng",
            label: "Giỏ hàng",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            tooltip: "Thông báo",
            label: "Thông báo",
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

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../views/Gio_Hang/CartScreen.dart';
import '../views/ThongBao_CaiDat_CaNhan/notification_screen.dart';
import '../views/ThongBao_CaiDat_CaNhan/profile_screen.dart';
import '../views/TrangChu/HomePage.dart';


class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key, 
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
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
      backgroundColor: Color(0xFFADDDFF),
       items: const [
            Icon(Icons.home, size: 30),
            Icon(Icons.shopify, size: 30),
            Icon(Icons.notifications, size: 30),
            Icon(Icons.person, size: 30),
          ],
        onTap: (index) {
          setState(() {
            current_index = index;
          });
        },
      ),
      body: pages[current_index],
    );
  }
}

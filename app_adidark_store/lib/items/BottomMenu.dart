import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool isLoggedIn = false; // Biến lưu trạng thái đăng nhập

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  // Kiểm tra trạng thái đăng nhập
  void checkLoginStatus() {
    _auth.authStateChanges().listen((user) {
      setState(() {
        isLoggedIn = (user != null);
      });
    });
  }

  // Danh sách trang dựa trên trạng thái đăng nhập
  List<Widget> get pages {
    if (isLoggedIn) {
      return [
        const HomePage(),
        const CartScreen(),
        const NotificationScreen(),
        const ProfileScreen(),
      ];
    } else {
      return [
        const HomePage(),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFFADDDFF),
        items: const [
          Icon(Icons.home, size: 30),
          Icon(Icons.shopify, size: 30),
          Icon(Icons.notifications, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: isLoggedIn ? (index) {
        setState(() {
          current_index = index;
        });
      } : null,
      ),
      body: pages[current_index],
    );
  }
}

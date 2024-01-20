import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

class _BottomMenuState extends State<BottomMenu> with SingleTickerProviderStateMixin  {
  int current_index = 0;
  bool isLoggedIn = false; // Biến lưu trạng thái đăng nhập
   late AnimationController controller;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
    return [
      const HomePage(),
      const CartScreen(),
      const NotificationScreen(),
      const ProfileScreen(),
    ];
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFFADDDFF),
        items: [
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
          letIndexChange: (value){
        if(!isLoggedIn&&value==1){
          showFailureDialog();
          return false;
        }
        return true;
      },
      ),
      body: pages[current_index],
    );
  }

  Future<void> showFailureDialog({String? message}) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/animations/login_failure.json',
              repeat: false,
              controller: controller,
              onLoaded: (composition) {
                controller.duration = composition.duration;
                controller.forward();
              },
            ),
            Text(
              message ?? "Vui lòng đăng nhập để tiếp tục",
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

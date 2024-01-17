import 'package:app_adidark_store/items/BottomMenu.dart';
import 'package:app_adidark_store/items/auth_page.dart';
import 'package:app_adidark_store/views/ChiTietHoaDon/ChiTietHoaDon_Screen.dart';
import 'package:app_adidark_store/views/ChiTiet_SanPham/ProDetailScreen.dart';
import 'package:app_adidark_store/views/Gio_Hang/CartScreen.dart';
import 'package:app_adidark_store/views/SignUp_In/SignInScreen.dart';
import 'package:app_adidark_store/views/TrangChu/HomePageFix.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'views/HoaDon/HoaDon_Screen.dart';
import 'views/SignUp_In/respository/Authentication_Repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blue, fontFamily: "Mulish"),
      home: const AuthPage(),
      // email: abc@gmail.com
      // pass: 123
      debugShowCheckedModeBanner: false,
    );
  }
}

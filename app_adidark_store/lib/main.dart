import 'package:app_adidark_store/items/BottomMenu.dart';
import 'package:app_adidark_store/views/ChiTietHoaDon/ChiTietHoaDon_Screen.dart';
import 'package:app_adidark_store/views/ChiTiet_SanPham/ProDetailScreen.dart';
import 'package:app_adidark_store/views/Gio_Hang/CartScreen.dart';
import 'package:app_adidark_store/views/SignUp_In/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'views/HoaDon/HoaDon_Screen.dart';

Future<void> main() async {
  // final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  // await GetStorage.init();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // .then((FirebaseApp value) => Get.put(Auth_Resposity()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blue, fontFamily: "Mulish"),
      home: const Login_Screen(),
      // email: abc@gmail.com
      // pass: 123
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:app_adidark_store/items/BottomMenu.dart';
import 'package:app_adidark_store/views/Gio_Hang/CartScreen.dart';
import 'package:app_adidark_store/views/SignUp_In/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blue, fontFamily: "Mulish"),
      home: const CartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

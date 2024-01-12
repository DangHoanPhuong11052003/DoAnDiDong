import 'package:app_adidark_store/Screens/HoaDon/HoaDon_Screen.dart';
import 'package:app_adidark_store/Screens/SignUp_In/SignUpScreen.dart';
import 'package:app_adidark_store/Screens/ThongBao_CaiDat_CaNhan/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Screens/ChiTiet_SanPham/ProDetailScreen.dart';
import 'Screens/SignUp_In/SignInScreen.dart';
import 'firebase_options.dart';
import 'Provider/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.blue, fontFamily: "Mulish"),
        home: const SignUp(),
        // sdt: 123
        // pas: abc
        debugShowCheckedModeBanner: false,
      ));
}

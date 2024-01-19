<<<<<<< Updated upstream
import 'package:app_adidark_store/Screens/SignUp_In/SignInScreen.dart';
=======
import 'package:app_adidark_store/items/auth_page.dart';
import 'package:app_adidark_store/views/Gio_Hang/CartScreen.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'Provider/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

<<<<<<< Updated upstream
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Mulish"),
        home: Login_Screen(),
        // sdt: 123
        // pas: abc
        debugShowCheckedModeBanner: false,
      ));
=======
class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blue, fontFamily: "Mulish"),
      home: const CartScreen(),
      // email: tự đăng ký
      // pass: tự đăng -up
      debugShowCheckedModeBanner: false,
    );
  }
>>>>>>> Stashed changes
}

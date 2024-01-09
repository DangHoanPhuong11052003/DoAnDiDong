import 'package:app_adidark_store/screen/Reset_Password.dart';
import 'package:app_adidark_store/screen/SignInScreen.dart';
import 'package:app_adidark_store/screen/SignUpScreen.dart';
import 'package:app_adidark_store/screen/Verifcation_Email.dart';
import 'package:app_adidark_store/screen/Verification_OTP.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';;
import 'firebase_options.dart';
import 'package:app_adidark_store/views/HoaDon_Screens/HoaDon_Screen.dart';
import 'package:app_adidark_store/views/ChiTietHoaDon_Screens/ChiTietHoaDon_Screen.dart';
import 'items/auth_page.dart';
import 'provider/google_sign_in.dart';

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
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ResetPassword(),
        debugShowCheckedModeBanner: false,
      ));
}

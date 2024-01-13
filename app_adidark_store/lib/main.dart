import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/SignUp_In/SignInScreen.dart';
import 'firebase_options.dart';

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

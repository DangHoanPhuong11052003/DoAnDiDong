import 'package:app_adidark_store/Model/ClassAddress.dart';
import 'package:app_adidark_store/Screen/CartScreen.dart';
import 'package:app_adidark_store/Screen/OrderAddressScreen.dart';
import 'package:app_adidark_store/Screen/OrderScreen.dart';
import 'package:app_adidark_store/Screen/PaymentMethodsScreen.dart';
import 'package:app_adidark_store/Screen/ProDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CartScreen()
      
    );
  }
}



//import 'package:flutter/foundation.dart';
import 'package:app_adidark_store/views/HoaDon_Screens/HoaDon_List.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChoXacNhan_Screen extends StatefulWidget {
  const ChoXacNhan_Screen({super.key});

  @override
  State<ChoXacNhan_Screen> createState() => _ChoXacNhan_ScreenState();
}

class _ChoXacNhan_ScreenState extends State<ChoXacNhan_Screen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HoaDon_List(),
          
        ],
      ),
    );
  }
}
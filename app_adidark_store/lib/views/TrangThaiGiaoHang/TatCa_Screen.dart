import 'package:flutter/material.dart';
import '../HoaDon/HoaDon_List_All.dart';

class TatCa_Screen extends StatefulWidget {
  const TatCa_Screen({super.key});

  @override
  State<TatCa_Screen> createState() => _TatCa_ScreenState();
}

class _TatCa_ScreenState extends State<TatCa_Screen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(child: HoaDon_List_All(),
          )         
        ],
      ); 
  }
}
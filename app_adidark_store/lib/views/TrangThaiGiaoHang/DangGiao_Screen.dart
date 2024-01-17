import 'package:flutter/material.dart';
import '../HoaDon/HoaDon_List.dart';

class DangGiao_Screen extends StatefulWidget {
  const DangGiao_Screen({super.key});

  @override
  State<DangGiao_Screen> createState() => _DangGiao_ScreenState();
}

class _DangGiao_ScreenState extends State<DangGiao_Screen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(child: HoaDon_List(trangthai: "Đang giao",),
          )         
        ],
      ); 
  }
}
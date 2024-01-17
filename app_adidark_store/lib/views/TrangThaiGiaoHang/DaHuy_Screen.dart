import 'package:flutter/material.dart';
import '../HoaDon/HoaDon_List.dart';
class DaHuy_Screen extends StatefulWidget {
  const DaHuy_Screen({super.key});

  @override
  State<DaHuy_Screen> createState() => _DaHuy_ScreenState();
}

class _DaHuy_ScreenState extends State<DaHuy_Screen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(child: HoaDon_List(trangthai: "Đã hủy",),
          )         
        ],
      ); 
  }
}
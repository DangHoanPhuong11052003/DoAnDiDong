import 'package:flutter/material.dart';
import '../HoaDon/HoaDon_List.dart';

class DaGiaO_Screen extends StatefulWidget {
  const DaGiaO_Screen({super.key});

  @override
  State<DaGiaO_Screen> createState() => _DaGiaO_ScreenState();
}

class _DaGiaO_ScreenState extends State<DaGiaO_Screen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(child: HoaDon_List(trangthai: "Đã giao",),
          )         
        ],
      ); 
  }
}
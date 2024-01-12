//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "ChiTietHoaDon_Item.dart";

class ChiTietHoaDon_List extends StatefulWidget {
  const ChiTietHoaDon_List({super.key});

  @override
  State<ChiTietHoaDon_List> createState() => _ChiTietHoaDon_ListState();
}

class _ChiTietHoaDon_ListState extends State<ChiTietHoaDon_List> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 1.47,
      crossAxisCount: 1,
      shrinkWrap: true,
      children: [
        ChiTietHoaDon_Item(),
        ChiTietHoaDon_Item(),
        ChiTietHoaDon_Item(),
      ],
    );
  }
}

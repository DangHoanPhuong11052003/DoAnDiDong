//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'HoaDon_Item.dart';

class HoaDon_List extends StatefulWidget {
  const HoaDon_List({super.key});

  @override
  State<HoaDon_List> createState() => _HoaDon_ListState();
}

class _HoaDon_ListState extends State<HoaDon_List> {
  @override
  Widget build(BuildContext context) {
     return GridView.count(
      childAspectRatio: 2.49,
      crossAxisCount: 1,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        HoaDon_Item(MaHoaDon: "123", NgayDatHang: "30/7/2003", TrangThai: "Đang xác nhận", TongHoaDon: "24.000.000 VND"),
        HoaDon_Item(MaHoaDon: "123", NgayDatHang: "30/7/2003", TrangThai: "Đang xác nhận", TongHoaDon: "24.000.000 VND"),
        HoaDon_Item(MaHoaDon: "123", NgayDatHang: "30/7/2003", TrangThai: "Đang xác nhận", TongHoaDon: "24.000.000 VND"),
       
      ],

    );
  }
}
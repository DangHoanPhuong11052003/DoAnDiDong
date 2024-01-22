//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../TrangThaiGiaoHang/ChoXacNhan_Screen.dart';
import '../TrangThaiGiaoHang/DaGiao_Screen.dart';
import '../TrangThaiGiaoHang/DaHuy_Screen.dart';
import '../TrangThaiGiaoHang/DangGiao_Screen.dart';
import '../TrangThaiGiaoHang/TatCa_Screen.dart';

class HoaDon_Screen extends StatefulWidget {
  const HoaDon_Screen({super.key});

  @override
  State<HoaDon_Screen> createState() => _HoaDon_ScreenState();
}

class _HoaDon_ScreenState extends State<HoaDon_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Hóa đơn"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(30),
                child: TabBar(
                  labelColor:
                      Color(0xFF9CBFD9), // Màu chữ của tab đang được chọn
                  indicatorColor: Color(0xFF9CBFD9),
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: "Tất cả",
                    ),
                    Tab(
                      text: "Chờ xác nhận",
                    ),
                    Tab(
                      text: "Đang giao",
                    ),
                    Tab(
                      text: "Đã giao",
                    ),
                    Tab(
                      text: "Đã hủy",
                    ),
                  ],
                )),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      child: TatCa_Screen(),),
                    Container(
                      child: ChoXacNhan_Screen(),
                    ),
                    Container(
                      child: DangGiao_Screen(),
                    ),
                    Container(
                      child: DaGiaO_Screen(),
                    ),
                    Container(
                      child: DaHuy_Screen(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

//import 'ChiTietHoaDon_Item.dart';
import 'package:flutter/material.dart';
import 'ChiTietHoaDon_List.dart';

class ChiTietHoaDon_Screen extends StatefulWidget {
  const ChiTietHoaDon_Screen({super.key});

  @override
  State<ChiTietHoaDon_Screen> createState() => _ChiTietHoaDon_ScreenState();
}

class _ChiTietHoaDon_ScreenState extends State<ChiTietHoaDon_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết hóa đơn"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mã hóa đơn: 1345",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              "Ngày đặt hàng: 30/7/2023",
              style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ChiTietHoaDon_List(),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Địa chỉ giao hàng",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              "Huỳnh Thúc Kháng, Quận 1, TP Hồ Chí Minh",
              style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(),
            SizedBox(
              height: 15,
            ),
            Text(
              "Thanh Toán",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "Tổng tiền: 24.000.000",
              style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 15),
            ),
            Text(
              "Chiết khấu: 100.00 VND",
              style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 15),
            ),
            Text(
              "Phí vận chuyển: 0 VND",
              style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(),
            SizedBox(
              height: 15,
            ),
            Text(
              "Tổng hóa đơn: 23.900.000 VND ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

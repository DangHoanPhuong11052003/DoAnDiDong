//import 'ChiTietHoaDon_Item.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:app_adidark_store/models/DataNotification..dart';
import 'package:app_adidark_store/models/DataProduct.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'ChiTietHoaDon_List.dart';
import 'package:app_adidark_store/models/Invoice.dart';

class ChiTietHoaDon_Screen extends StatefulWidget {
  ChiTietHoaDon_Screen({
    super.key,
    required this.invoice,
  });
  final Invoice invoice;
  @override
  State<ChiTietHoaDon_Screen> createState() => _ChiTietHoaDon_ScreenState();
}

class _ChiTietHoaDon_ScreenState extends State<ChiTietHoaDon_Screen> {
  DatabaseReference _database = FirebaseDatabase.instance.ref();
  List<Product> pros = [];

  _getData() async {
    List<Product> pros2 = await DataProduct.getAllData();
    setState(() {
      pros = pros2;
    });

    _database.child('Products').onChildAdded.listen((event) {
      setState(() {
        _getData();

        DataNotification.createMainData(pros.last);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chi tiết hóa đơn",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:
          //SingleChildScrollView(
          //child:
          Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mã hóa đơn: ${widget.invoice.id}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "Ngày đặt hàng: ${widget.invoice.date}",
              style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: ChiTietHoaDon_List(id: widget.invoice.id)),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Địa chỉ giao hàng",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              widget.invoice.address,
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
              "Tổng tiền: ${widget.invoice.totalPrice}",
              style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 15),
            ),
            Text(
              "Chiết khấu: 0 VND",
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
              "Tổng hóa đơn: ${widget.invoice.totalPrice} ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      //),
    );
  }
}

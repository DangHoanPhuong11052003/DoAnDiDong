//import 'package:flutter/foundation.dart';
import 'package:app_adidark_store/views/ChiTietHoaDon/ChiTietHoaDon_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_adidark_store/models/Invoice.dart';

class HoaDon_Item extends StatefulWidget {
  HoaDon_Item(
      {super.key,
      required this.invoice});

  final Invoice invoice;
  

  @override
  State<HoaDon_Item> createState() => _HoaDon_ItemState();
}



class _HoaDon_ItemState extends State<HoaDon_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.grey, // Viền màu đen
          width: 0.75, // Độ dày viền là 3
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text("Mã hóa đơn: ${widget.invoice.id}",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
              ),

              //SizedBox(width:10,),
              Container(
                padding: EdgeInsets.all(2.0),
                width: 110,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFCBE9FF),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  widget.invoice.status,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          Text(
            "Ngày đặt hàng: ${widget.invoice.date}",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
          ),
          Text(
            "Tổng tiền: ${widget.invoice.totalPrice}",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFCBE9FF), // Thay đổi màu nền tại đây
                  ),
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                               ChiTietHoaDon_Screen(invoice: widget.invoice)));
                  },
                  child: Text(
                    "Xem chi tiết",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Hủy đơn",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

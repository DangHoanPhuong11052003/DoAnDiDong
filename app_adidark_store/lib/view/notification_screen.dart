import 'package:app_adidark_store/item/notice_item.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(203, 233, 255, 0.4),
        title: Center(
          child: Text(
            "Notifications",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(203, 233, 255, 0.4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                NoticeItem(
                    img:
                        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSPiAeJIvM9eGUo7V5xvcDf3UdeeJ-yvmxj3dhOVAAVCgB70D1NJQDRgq8lD-NJGoe3AVoqkxCtEbzR4PAFYY_E6Rsfjjczyg0UTcdIfwsDkNxHxBdsWgeYog&usqp=CAE",
                    title: "Shop vừa ra sản phẩm mới, mời bạn đến xem!",
                    time: "9:13 PM"),
                NoticeItem(
                    img:
                        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTff-PQdVmxGjtuq6MgudKFOhov6lMZ5IUUqlKK7B2FD6uZ6TZU-vn1n1FWXBXKZvQ-UUWwyXCKofoF4xYkpEYUn81rulJY-u_Vq5Qc42A&usqp=CAE",
                    title: "Shop vừa ra sản phẩm mới, mời bạn đến xem!",
                    time: "9:13 PM"),
                NoticeItem(
                    img:
                        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ-wplxoYMkBIxrS-C0ohc9wZWjTh-WFviaOdIuXpc-G8B3vpieOt-AbDWHPvoPZe_Mr4ulVM6ncHgFp-Q63y22H60y_kOHKvUJ3ZaWwWAJ2Hi4t7LBs2WO&usqp=CAE",
                    title: "Shop vừa ra sản phẩm mới, mời bạn đến xem!",
                    time: "9:13 PM"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

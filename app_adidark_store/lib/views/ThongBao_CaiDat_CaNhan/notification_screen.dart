import 'package:flutter/material.dart';

import '../../items/notice_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
            child: Text(
              "Thông báo",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: const SingleChildScrollView(
          child: Center(
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
        ));
  }
}

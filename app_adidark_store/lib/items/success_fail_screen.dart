import 'package:flutter/material.dart';

class SuccessFailScreen extends StatelessWidget {
  const SuccessFailScreen({super.key, required this.state});

  final bool state;

  static const String success = "Bạn đã thanh toán thành công";
  static const String fail = "Bạn đã thanh toán không thành công";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  state ? success : fail,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Icon(
                state ? Icons.check_circle : Icons.cancel,
                color: state ? Colors.green[300] : Colors.red[300],
                size: MediaQuery.of(context).size.width / 2,
              ),
              GestureDetector(
                child: Text(
                  "Xem chi tiết đơn hàng",
                  style: TextStyle(color: Colors.red[400]),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Color.fromRGBO(203, 233, 255, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Quay về trang chủ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

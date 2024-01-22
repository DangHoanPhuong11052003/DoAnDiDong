import 'package:app_adidark_store/views/ChiTiet_SanPham/ProDetailScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';

import '../views/SignUp_In/SignInScreen.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});
  final Product product;
  @override
  State<ProductItem> createState() => _ProducItemState();
}

class _ProducItemState extends State<ProductItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    bool isLoggedIn = user != null;
    return GestureDetector(
      onTap: () {
        if (isLoggedIn) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProDetailScreen(idPro: widget.product.id)),
          );
        } else {
          showDoneDialog();
        }
      },
      child: Container(
        width: 200,
        height: 100,
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
        ),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        decoration: BoxDecoration(
            color: Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(
              20,
            )),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Image.network(
                widget.product.img[0].link,
                height: 100,
                width: 100,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                widget.product.name,
                style: TextStyle(
                    fontSize: 12,
                    //color: Color(0xFF4C53A5),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "12.000.000 VND",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        //color: Color(0xFF4C53A5),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showDoneDialog() async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/animations/login_failure.json',
              repeat: false,
              controller: controller,
              onLoaded: (composition) {
                controller.duration = composition.duration;
                controller.forward();
              },
            ),
            Text(
              "Vui lòng đăng nhập để tiếp tục",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

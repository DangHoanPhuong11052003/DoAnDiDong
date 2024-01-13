import 'package:flutter/material.dart';
import '../../Items/ItemCart.dart';
import '../Thanh_Toan/OrderAddressScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List lst_vtSum = [];
  int totalPrice = 0;
  int slspchon = 0;
  bool isSelectedAll = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Giỏ hàng", style: TextStyle(fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 3,
        itemBuilder: (context, index) {
          return ItemCart(
            price: 1000000 * index,
            idCart: index,
            lst_vtSelected: lst_vtSum,
            isPressedAll: isSelectedAll,
            sumPrice: () {
              setState(() {
                lst_vtSum.add(index);
                totalPrice += 1000000 * index;
                slspchon++;
                if (lst_vtSum.length == 3) {
                  isSelectedAll = true;
                }
              });
            },
            minusPrice: () {
              setState(() {
                lst_vtSum.remove(index);
                totalPrice -= 1000000 * index;
                slspchon--;
                isSelectedAll ? isSelectedAll = false : null;
              });
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        height: 190,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelectedAll = !isSelectedAll;
                  if (isSelectedAll) {
                    totalPrice = 3 * 1000000;
                    slspchon = 3;
                    for (var i = 0; i < 3; i++) {
                      lst_vtSum.add(i);
                    }
                  } else {
                    totalPrice = 0;
                    slspchon = 0;
                    lst_vtSum.clear();
                  }
                });
              },
              child: Row(
                children: [
                  !isSelectedAll
                      ? Icon(
                          Icons.circle_outlined,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.task_alt_outlined,
                          color: Colors.red,
                        ),
                  Text(" Chọn tất cả sản phẩm",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Số đơn hàng đã chọn: ",
                        style: TextStyle(fontSize: 18)),
                    Text(
                      "$slspchon sản phẩm",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng tiền:", style: TextStyle(fontSize: 18)),
                    Text(
                      "$totalPrice VND",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            GestureDetector(
              onTap: () {
                if (slspchon > 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderAddressScreen()));
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: slspchon == 0
                        ? Colors.grey
                        : const  Color(0xFFADDDFF)),
                height: 50,
                width: 200,
                child: const Text(
                  "ĐẶT HÀNG",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        ),
      ),
    );
  }
}

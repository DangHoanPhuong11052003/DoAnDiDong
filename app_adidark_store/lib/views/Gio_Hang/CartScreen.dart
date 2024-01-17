import 'dart:math';

import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:app_adidark_store/models/DataCartUser.dart';
import 'package:flutter/material.dart';
import '../../items/ItemCart.dart';
import '../Thanh_Toan/OrderAddressScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key,this.acc="234"});
  final String acc;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartUser> lstCarts=[];
  List lst_vtSum = [];
  double totalPrice = 0;
  int slspchon = 0;
  bool isSelectedAll = false;

  _setupData() async{
    List<CartUser> lstCartsData=await DataCartUser.getData(widget.acc);
    setState(() {
      lstCarts=lstCartsData;
    });
  }

  _updatePrice(){
    totalPrice=0;
    lstCarts.forEach((element) {
      if(lst_vtSum.contains(element.id)){
        totalPrice+=element.price*element.quantity;
      }
    },);
  }

  @override
  void initState() {
    super.initState();
     _setupData();
  }

  @override
  Widget build(BuildContext context) {
    _updatePrice();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Giỏ hàng", style: TextStyle(fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      body: lstCarts.isEmpty?
            Container(
              alignment: Alignment.center,
              child: Text("Hiện chưa có sản phẩm nào!",style: TextStyle(fontSize: 25),)
            ):
            ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: lstCarts.length,
        itemBuilder: (context, index) {
          return ItemCart(
            setupData: () {
              _setupData();
            },
            updatePrice: () {
              setState(() {
                _updatePrice();
              });
            },
            acc: widget.acc,
            cart: lstCarts[index],
            lst_vtSelected: lst_vtSum,
            sumPrice: () {
              setState(() {
                lst_vtSum.add(lstCarts[index].id);
                slspchon++;
                if (lst_vtSum.length == lstCarts.length) {
                  isSelectedAll = true;
                }
              });
            },
            minusPrice: () {
              setState(() {
                lst_vtSum.remove(lstCarts[index].id);
                slspchon--;
                isSelectedAll = false;
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
                     lstCarts.forEach((element) {
                      lst_vtSum.add(element.id);
                    });
                    slspchon = lstCarts.length;
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

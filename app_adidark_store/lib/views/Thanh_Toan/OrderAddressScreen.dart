
import 'package:app_adidark_store/items/ItemInforAddress.dart';
import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:flutter/material.dart';
import '../../models/ClassAddress.dart';
import 'PaymentMethodsScreen.dart';

class OrderAddressScreen extends StatefulWidget {
  OrderAddressScreen({super.key, this.address, this.carts});
  Address? address;
  List<CartUser>? carts;

  @override
  State<OrderAddressScreen> createState() => _OrderAddressScreenState();
}

class _OrderAddressScreenState extends State<OrderAddressScreen> {
  List<Address> lstAddress = [
    Address(
        id: 0,
        detail: "Ấp Xóm Thủ, xã Bình Tân, huyện Gò Công Tây, tỉnh Tiền Giang 0",
        location: 0,
        type: true),
    Address(
        id: 1,
        detail: "Ấp Xóm Thủ, xã Bình Tân, huyện Gò Công Tây, tỉnh Tiền Giang 1",
        location: 1,
        type: false),
    Address(
        id: 2,
        detail: "Ấp Xóm Thủ, xã Bình Tân, huyện Gò Công Tây, tỉnh Tiền Giang 2",
        location: 1,
        type: false)
  ];
  Address addressSelected =
      Address(detail: "", location: -1, type: false, id: -1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chọn địa chỉ giao hàng",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          for (var i = 0; i < lstAddress.length; i++)
            ItemInforAddress(
              address: lstAddress[i],
              addressSelected: addressSelected,
              changeSelectedId: () {
                setState(() {
                  addressSelected = lstAddress[i];
                });
              },
            ),
          GestureDetector(
            onTap: () {
              //Thêm mới địa chỉ
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 103, 183, 248)),
              height: 50,
              width: 250,
              child: Text(
                "+ Thêm địa chỉ mới",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      )),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (widget.address != null) {
            Navigator.pop(context, addressSelected);
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentMethodsScreen(
                          address: addressSelected,
                          carts: widget.carts,
                        )));
          }
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 103, 183, 248)),
          height: 50,
          width: 200,
          child: Text(
            "TIẾP TỤC",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    if (widget.address != null) {
      addressSelected = widget.address!;
    } else {
      for (var i in lstAddress) {
        if (i.type) {
          addressSelected = i;
        }
      }
    }
    super.initState();
  }
}

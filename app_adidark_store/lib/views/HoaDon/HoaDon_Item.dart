
import 'dart:async';
import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:app_adidark_store/views/ChiTietHoaDon/ChiTietHoaDon_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_adidark_store/models/Invoice.dart';
import 'package:app_adidark_store/models/ClassInvoiceDetail.dart';
import 'package:app_adidark_store/models/DataInvoice.dart';
import 'package:app_adidark_store/models/DataProduct.dart';
import 'package:app_adidark_store/models/DataInvoiceDetail.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HoaDon_Item extends StatefulWidget {
  HoaDon_Item(
      {super.key,
      required this.invoice});

  final Invoice invoice;
  

  @override
  State<HoaDon_Item> createState() => _HoaDon_ItemState();
}

class _HoaDon_ItemState extends State<HoaDon_Item> {
  

 
  bool autoCancel = false;
  
  void initState() {
      super.initState();
      Waitforconfim();
     
    }
  
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
  void Waitforconfim() {
    const int autoCancelTimeInSeconds = 30;

    Timer(Duration(seconds: autoCancelTimeInSeconds), () {
      // Kiểm tra xem đơn hàng có trong trạng thái "Chờ xác nhận" không và chưa tự động hủy
      if (widget.invoice.status == "Chờ xác nhận" && !autoCancel) {
        // Thực hiện cập nhật trạng thái "Đã hủy"
        setState(() {
          widget.invoice.status = "Đang giao";
          autoCancel = true; // Đánh dấu là đã tự động hủy
        });

        // Cập nhật trạng thái trong Firebase
        datainvoice.updateInvoiceStatus(user!.uid, widget.invoice.id, 'Đang giao');
      }
    });
  }
  User? user=FirebaseAuth.instance.currentUser;
  DataInvoice datainvoice = new DataInvoice();
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
            "Tổng tiền: ${widget.invoice.totalPrice} VND",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
          ),
           widget.invoice.status == "Chờ xác nhận" ?
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
                  child: const Text(
                    "Xem chi tiết",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
              ElevatedButton(
  onPressed: () async {
    bool isConnected = await checkInternetConnection();
    if (isConnected) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Xác nhận"),
            content: Text("Bạn có chắc chắn muốn hủy đơn?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); 
                },
                child: Text("Không"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.invoice.status = "Đã hủy";
                  });
                  datainvoice.updateInvoiceStatus(user!.uid,widget.invoice.id,'Đã hủy');
                  Navigator.of(context).pop(); 
                },
                child: Text("Có"),
              ),
            ],
          );
        },
      );
    } else {
      // Hiển thị thông báo không có kết nối mạng
    }
  },
  child: const Text(
    "Hủy đơn",
    style: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
  ),
)
            ],          
          )
          : widget.invoice.status == "Đang giao"
          ?Row(
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
                  child: const Text(
                    "Xem chi tiết",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                                widget.invoice.status = "Đã giao";
                              });
                            
                  datainvoice.updateInvoiceStatus(user!.uid,widget.invoice.id,'Đã giao');
                },
                child: const Text(
                  "Đã giao",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],          
          )
          :Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  child: const Text(
                    "Xem chi tiết",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),

            ],
          )
        ],
      ),
    );
  }
}
//   List<CartUser> cartuser = [];
//   void updatedQuantityProCancel(List<CartUser> cartItems)  {
//   for (var cartItem in cartItems) {
    
//      DataProduct().updateItemCancel(user!.uid, widget.invoice.id,cartItem.size, cartItem.color,cartItem.quantity);
//   }
  
  
// }
// void Delivering() {
  //   const int autoCancelTimeInSeconds = 10;

  //   Timer(Duration(seconds: autoCancelTimeInSeconds), () {
      
  //     if (widget.invoice.status == "Đang giao" && !autoCancel) {
  //       // Thực hiện cập nhật trạng thái "Đã hủy"
  //       setState(() {
  //         widget.invoice.status = "Đã giao";
  //         autoCancel = true; // 
  //       });
  //       datainvoice.updateInvoiceStatus(user!.uid, widget.invoice.id, 'Đã giao');
  //     }
  //   });
  // }
  //   Future<void> loadInvoiceDetails() async {
  //   try {
      
  //     List<CartUser> invoiceDetails = await DataInvoiceDetail().loadInvoiceDetails (
  //       user!.uid,  
  //       widget.invoice.id,  
  //     );

     
  //     setState(() {
  //       cartuser = invoiceDetails;
  //     });
  //   } catch (e) {
  //     print('Error loading and updating cartuser: $e');
  //   }
  // }
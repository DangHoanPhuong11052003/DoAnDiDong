import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ItemProOrder extends StatelessWidget {
   ItemProOrder({super.key, required this.cart});
  final CartUser cart;
    

  @override
  Widget build(BuildContext context) {
    return  Container (
      margin: const EdgeInsets.only(bottom: 5),
      padding:const EdgeInsets.all(2),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 2,color:Colors.black),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
                width: MediaQuery.of(context).size.width/3,
                height: MediaQuery.of(context).size.width/2.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //Ảnh sản phẩm
                  image:  DecorationImage(image: NetworkImage(cart.img),
                  fit: BoxFit.cover),
                  
              ),
            ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Tông tin sản phẩm
              //Tên sản phẩm
              Text(cart.namePro.length>=15?cart.namePro.substring(0,15)+"...":cart.namePro,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              //Hãng, loại
              Text("${cart.manufucturer} | Giày ${cart.cate}"),
              //Màu
              Text("Màu: ${cart.color}" == "a"
                      ? "Đen"
                      : cart.color == "b"
                          ? "Trắng"
                          : cart.color == "c"
                              ? "Vàng"
                              : cart.color == "d"
                                  ? "Xanh dương"
                                  :cart.color == "e"
                                      ? "Xám"
                                      : cart.color == "f"
                                          ? "Nâu"
                                          : cart.color == "g"
                                              ? "Cam"
                                              : cart.color == "h"
                                                  ? "Tím"
                                                  : cart.color == "j"
                                                      ? "Xanh lá"
                                                      : "Hồng",),
              //Kích Cỡ
              
            ],
          ),
          const Padding(padding: EdgeInsets.only(right: 10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Text("Cỡ: ${cart.size}"),
              //số lượng sp
              Text(cart.quantity<10?"Số lượng: 0${cart.quantity}":"Số lượng: ${cart.quantity}",style: TextStyle(fontSize: 15)),
                  //Giá
              Text((cart.price*cart.quantity).toString().length>8?(cart.price*cart.quantity).toString().substring(0,8)+"...VND":(cart.price*cart.quantity).toString()+"VND",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
            ],
          )
            ],
          )
        ],
      ),
    );
  }
  
}

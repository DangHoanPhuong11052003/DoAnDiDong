import 'package:flutter/material.dart';

class ItemProOrder extends StatelessWidget {
  const ItemProOrder({super.key, required this.price});
  final int price;

  @override
  Widget build(BuildContext context) {
    int slsp=1;
    return  Container(
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
              image:const  DecorationImage(image: NetworkImage("https://drake.vn/image/catalog/H%C3%ACnh%20content/gia%CC%80y%20Converse%20da%20bo%CC%81ng/giay-converse-da-bong-5.jpg"),
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
              Text("Super OG",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              //Hãng, loại
              Text("Nike | Giày nam"),
              //Màu
              Text("Màu: Đỏ"),
              //Kích Cỡ
              
            ],
          ),
          const Padding(padding: EdgeInsets.only(right: 10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Text("Cỡ: 38"),
              //số lượng sp
              Text(slsp<10?"Số lượng: 0$slsp":"Số lượng: $slsp",style: TextStyle(fontSize: 15)),
                  //Giá
              Text("${price*slsp} VND",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
            ],
          )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChiTietHoaDon_Item extends StatefulWidget {
  const ChiTietHoaDon_Item({super.key});


  @override
  State<ChiTietHoaDon_Item> createState() => _ChiTietHoaDon_ItemState();
}

class _ChiTietHoaDon_ItemState extends State<ChiTietHoaDon_Item> {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.symmetric( vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 400,
      decoration: BoxDecoration(
         border: Border.all(
                color: Colors.grey,  
                width: 0.75,            
              ),
        
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Row(       
            children: [         
              Container(
                width: MediaQuery.of(context).size.width/2.5,
                height: MediaQuery.of(context).size.width/2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                 
                  //Ảnh sản phẩm
                  image:const  DecorationImage(image: NetworkImage("https://drake.vn/image/catalog/H%C3%ACnh%20content/gia%CC%80y%20Converse%20da%20bo%CC%81ng/giay-converse-da-bong-5.jpg"),
                  fit: BoxFit.cover),
                  
                ),
              ),
              const SizedBox(width: 10,),
              const Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  //Tông tin sản phẩm
                  //Tên sản phẩm
                  Text("Super OG",style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16)),
                  //Hãng, loại
                  Text("Nike | Giày nam"),
                  //Màu
                  Text("Màu: Đỏ"),
                  //Kích Cỡ
                  Text("Cỡ: 38"),
                  //Tăng giảm số lượng
                  Text("Số lượng: 1"),
                  Text("12.000.000 VND",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  
                ],
              ),             
                
            ],
          ),
          SizedBox(height: 7,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:Color(0xFFCBE9FF),  // Thay đổi màu nền tại đây
                ),
                onPressed: (){},
                child: Text("Mua lại",style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600))
                ),
               ElevatedButton(
                  onPressed: (){},
                  child: Text("Đánh giá",style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600))
                )
                    
            ],
          )
        ],
      ),
    );
  }
}
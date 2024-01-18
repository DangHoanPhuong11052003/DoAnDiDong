
import 'package:flutter/material.dart';
import 'package:app_adidark_store/models/ClassInvoiceDetail.dart';
import 'package:app_adidark_store/models/Invoice.dart';
class ChiTietHoaDon_Item extends StatefulWidget {
  const ChiTietHoaDon_Item({super.key , required this.invoicedetail});
  final InvoiceDetail invoicedetail;


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
                  image: DecorationImage(image: NetworkImage("${widget.invoicedetail.img}"),
                  fit: BoxFit.cover),
                  
                ),
              ),
              const SizedBox(width: 10,),
              Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  //Tông tin sản phẩm
                  //Tên sản phẩm
<<<<<<< Updated upstream:app_adidark_store/lib/Screens/ChiTietHoaDon/ChiTietHoaDon_Item.dart
                  Text("Super OG",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
=======
                  Text(widget.invoicedetail.namePro,style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16)),
>>>>>>> Stashed changes:app_adidark_store/lib/views/ChiTietHoaDon/ChiTietHoaDon_Item.dart
                  //Hãng, loại
                  Text("${widget.invoicedetail.manufucturer} |${widget.invoicedetail.cate} "),
                  //Màu
                  Text("Màu: ${widget.invoicedetail.color}"),
                  //Kích Cỡ
                  Text("Size: ${widget.invoicedetail.size}"),
                  //Tăng giảm số lượng
                  Text("Số lượng: ${widget.invoicedetail.quantity}"),
                  Text("${widget.invoicedetail.price}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  
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
                child: Text("Mua lại",style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 15),)
                ),
               ElevatedButton(
                  onPressed: (){},
                  child: Text("Đánh giá",style: TextStyle(color: Color(0xFF7F7F7F), fontSize: 15),)
                )
                    
            ],
          )
        ],
      ),
    );
  }
}
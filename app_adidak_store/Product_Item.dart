import 'package:app_adidark_store/views/ChiTiet_SanPham/ProDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class ProductItem extends StatelessWidget {
  const ProductItem({super.key , required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProDetailScreen(idPro: product.id,)),
          );
      },
      child: Container(
        width: 200,
        height: 100,
        padding: EdgeInsets.only(left: 15, right: 15,top: 15,),
        margin: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(20,)
        ),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProDetailScreen(idPro: product.id,),),);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.network(
                  
                  product.img[0].link, height: 100, width: 100,
                  ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                product.name,
                style: TextStyle(
                  fontSize: 12,
                  //color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.bold
      
                ),
              )
              ,
            ),
            Padding(
              padding:EdgeInsets.symmetric(vertical: 5),
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
}
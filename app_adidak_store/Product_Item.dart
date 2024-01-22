import 'package:app_adidark_store/views/ChiTiet_SanPham/ProDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
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
        width: 100,
        height: 200,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 140,
                child: Image.network(
                  product.img[0].link,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "12.000.000 VND",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8,),
              OverflowBar(
                
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton( 
                    child: const Text('Mua ngay', style: TextStyle(color: Colors.green),), onPressed: () {
                     Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => ProDetailScreen(idPro: product.id,)),
                         );
                    
                  }),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


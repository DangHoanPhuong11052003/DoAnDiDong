import 'package:flutter/material.dart';
import 'package:app_adidark_store/Testdata/model/product.dart';



class ProductItem extends StatelessWidget {
  const ProductItem({super.key , required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15,top: 15,),
      margin: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(20,)
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.network(product.url, height: 100, width: 100,),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              product.name,
              style: TextStyle(
                fontSize: 13,
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
    );
  }
}
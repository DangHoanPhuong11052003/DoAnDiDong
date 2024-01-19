import 'package:flutter/material.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';

import 'Product_Item.dart';
class ListProduct extends StatelessWidget {
  const ListProduct({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GridView.count(
      childAspectRatio: 0.70,
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(products.length, (index) {
          return ProductItem(product: products[index]);
        }),
    );
  }
  
}
